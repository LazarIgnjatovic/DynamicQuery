using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using AWExplore.Config;
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

        public DBController(IDBSettings dbSettings, ISQLService sqlService)
        {
            _sqlService = sqlService;
            _dbSettings = dbSettings;
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
            return tables;
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
            return fields;

        }
    }
}
