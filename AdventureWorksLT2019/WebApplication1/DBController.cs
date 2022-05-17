using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using AWExplore.Config;
using AWExplore.DTO;
using AWExplore.Models;
using AWExplore.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace AWExplore
{

    [Route("[controller]")]
    public class DBController : Controller
    {
        private readonly ISQLService _sqlService;
        private readonly IDBSettings _dbSettings;
        private readonly IConvertService _convertService;

        public DBController(IDBSettings dbSettings, ISQLService sqlService,IConvertService convertService)
        {
            _sqlService = sqlService;
            _dbSettings = dbSettings;
            _convertService = convertService;
        }
        
        [Route("tables")]
        [HttpGet]
        public List<string> GetTables()
        {
            List<string> tables = new List<string>();
            string query =String.Format(@"SELECT DISTINCT
                                            TABLE_NAME AS TableName
                                        FROM INFORMATION_SCHEMA.COLUMNS
                                        WHERE TABLE_SCHEMA='{0}'
                                        ORDER BY
                                            TableName;",_dbSettings.Schema);
            var queryResult=_sqlService.ExecuteQuery(query, _dbSettings);
            
            if (queryResult != null)
            {
                for (int i = 0; i < queryResult.Rows.Count; i++)
                {
                    tables.Add(queryResult.Rows[i]["TableName"].ToString());
                }
            }
            return _convertService.ConvertTableToAlias(tables);
        }

        [Route("fieldsFrom/{table}")]
        [HttpGet]
        public List<string> GetFieldsForTable(string table)
        {
            List<string> fields = new List<string>();

            string query = String.Format(@"SELECT
                                              COLUMN_NAME AS ColumnName
                                           FROM INFORMATION_SCHEMA.COLUMNS
                                           WHERE TABLE_NAME = @Table
                                           ORDER BY
                                              ColumnName;");
            List<SqlParameter> parameters = new List<SqlParameter>();
            parameters.Add(new SqlParameter("Table",table));
            var queryResult=_sqlService.ExecuteParametrizedQuery(query, _dbSettings, parameters);
            if (queryResult != null)
            {
                for (int i = 0; i < queryResult.Rows.Count; i++)
                {
                    fields.Add(queryResult.Rows[i]["ColumnName"].ToString());
                }
            }
            return _convertService.ConvertColumnToAlias(fields);
        }

        [Route("query")]
        [HttpPost]
        // vidi najbolji nacin da se vrati tabela
        public string Query([FromBody] QueryDTO q)
        {
            if (q.SelectedFields != null && q.SelectedFields.Count>0)
            {
                //SELECT
                string query = String.Format(@"SELECT ");
                List<Alias> selAliases=_convertService.FindFromColumnAliases(q.SelectedFields);
                List<Alias> orderAliases = _convertService.FindFromColumnAliases(q.OrderFields);
                foreach (Alias field in selAliases)
                {
                    query += field.TableAbbr+"."+field.ColumnName + ", ";
                }
                query = query.Remove(query.Length - 2, 2);

                //FROM
                query += String.Format(@"
                                    FROM SalesLT.SalesOrderHeader SH 
                                    INNER JOIN SalesLT.Customer CU ON SH.CustomerID=CU.CustomerID 
                                    INNER JOIN SalesLT.CustomerAddress CA ON CU.CustomerID=CA.CustomerID
                                    INNER JOIN SalesLT.Address AD ON CA.AddressID=AD.AddressID
                                    INNER JOIN SalesLT.SalesOrderDetail SD ON SD.SalesOrderID=SH.SalesOrderID
                                    INNER JOIN SalesLT.Product PR ON PR.ProductID=SD.ProductID
                                    INNER JOIN SalesLT.ProductCategory PC ON PC.ProductCategoryID=PR.ProductCategoryID
                                    INNER JOIN SalesLT.ProductModel PM ON PM.ProductModelID=PR.ProductModelID
                                    INNER JOIN SalesLT.ProductModelProductDescription PMD ON PMD.ProductModelID =PM.ProductModelID
                                    INNER JOIN SalesLT.ProductDescription PD ON PD.ProductDescriptionID=PMD.ProductDescriptionID ");

                //WHERE
                //GROUP BY
                if(q.GroupFields != null && q.GroupFields.Count>0)
                {
                    query += " GROUP BY ";
                    List<Alias> groupAliases = _convertService.FindFromColumnAliases(q.GroupFields);
                    foreach(Alias field in selAliases)
                    {
                        if(!groupAliases.Contains(field))
                            groupAliases.Add(field);
                    }
                    foreach (Alias field in orderAliases)
                    {
                        if (!groupAliases.Contains(field))
                            groupAliases.Add(field);
                    }
                    foreach (Alias field in groupAliases)
                    {
                        query += field.TableAbbr + "." + field.ColumnName + ", ";
                    }
                    query = query.Remove(query.Length - 2, 2);
                }
                //HAVING
                //ORDER BY
                if(q.OrderFields!=null && q.OrderFields.Count>0)
                {
                    query += " ORDER BY ";
                    foreach (Alias field in orderAliases)
                    {
                        query += field.TableAbbr + "." + field.ColumnName + ", ";
                    }
                    query = query.Remove(query.Length - 2, 2);

                    if(q.IsAscending)
                        query += " ASC ";
                    else
                        query += " DESC ";
                }

                List<SqlParameter> parameters = new List<SqlParameter>();
                var queryResult = _sqlService.ExecuteParametrizedQuery(query, _dbSettings, parameters);
                return _convertService.DataTableToJSONWithStringBuilder(queryResult);
            }
            Console.WriteLine("nothing sent!");
            return null;
        }
    }
}
