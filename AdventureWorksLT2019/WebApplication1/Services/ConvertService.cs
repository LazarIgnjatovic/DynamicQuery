using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using AWExplore.Models;

namespace AWExplore.Services
{
    public class ConvertService : IConvertService
    {
        private readonly AdventureWorksLT2019Context _dbContext;

        public ConvertService(AdventureWorksLT2019Context dbContext)
        {
            _dbContext = dbContext;
        }
        public List<string> ConvertColumnToAlias(List<string> columns)
        {
            List<string> aliases = new List<string>();
            if (columns != null)
            {
                foreach (string name in columns)
                {
                    Alias a = _dbContext.Aliases.Where(x => x.ColumnName == name).FirstOrDefault();
                    if (a != null && a.ColumnIgnore == false)
                    {
                        aliases.Add(a.ColumnAlias);
                    }
                }
            }
            return aliases;
        }

        public List<string> ConvertTableToAlias(List<string> tables)
        {
            List<string> aliases = new List<string>();
            if (tables != null)
            {
                foreach (string name in tables)
                {
                    Alias a = _dbContext.Aliases.Where(x => x.TableName == name).FirstOrDefault();
                    if (a != null && !a.TableIgnore)
                    {
                        aliases.Add(a.TableAlias);
                    }
                }
            }
            return aliases;
        }

        public List<Alias> FindFromColumnAliases(List<string> columnAliases)
        {
            List<Alias> aliases = new List<Alias>();
            if (columnAliases != null)
            {
                foreach(string name in columnAliases)
                {
                    Alias a = _dbContext.Aliases.Where(x => x.ColumnAlias == name).FirstOrDefault();
                    if (a != null)
                    {
                        aliases.Add(a);
                    }
                }
            }
            return aliases;
        }

        public string DataTableToJSONWithStringBuilder(DataTable table)
        {
            List<string> columns = new List<string>();
            foreach (DataColumn col in table.Columns)
            {
                columns.Add(col.ColumnName.ToString());
            }
            List<string> columnAliases = ConvertColumnToAlias(columns);
            var JSONString = new StringBuilder();
            if (table.Rows.Count > 0)
            {
                JSONString.Append("[");
                for (int i = 0; i < table.Rows.Count; i++)
                {
                    JSONString.Append("{");
                    for (int j = 0; j < table.Columns.Count; j++)
                    {
                        if (j < table.Columns.Count - 1)
                        {
                            JSONString.Append("\"" + columnAliases[j] + "\":" + "\"" + table.Rows[i][j].ToString() + "\",");
                        }
                        else if (j == table.Columns.Count - 1)
                        {
                            JSONString.Append("\"" + columnAliases[j] + "\":" + "\"" + table.Rows[i][j].ToString() + "\"");
                        }
                    }
                    if (i == table.Rows.Count - 1)
                    {
                        JSONString.Append("}");
                    }
                    else
                    {
                        JSONString.Append("},");
                    }
                }
                JSONString.Append("]");
            }
            return JSONString.ToString();
        }
        public string DataTableToJSONWithStringBuilderUnaliased(DataTable table)
        {
            var JSONString = new StringBuilder();
            if (table.Rows.Count > 0)
            {
                JSONString.Append("[");
                for (int i = 0; i < table.Rows.Count; i++)
                {
                    JSONString.Append("{");
                    for (int j = 0; j < table.Columns.Count; j++)
                    {
                        if (j < table.Columns.Count - 1)
                        {
                            JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\",");
                        }
                        else if (j == table.Columns.Count - 1)
                        {
                            JSONString.Append("\"" + table.Columns[j].ColumnName.ToString() + "\":" + "\"" + table.Rows[i][j].ToString() + "\"");
                        }
                    }
                    if (i == table.Rows.Count - 1)
                    {
                        JSONString.Append("}");
                    }
                    else
                    {
                        JSONString.Append("},");
                    }
                }
                JSONString.Append("]");
            }
            return JSONString.ToString();
        }
    }
    
}
