using AWExplore.Models;
using System.Collections.Generic;
using System.Data;

namespace AWExplore.Services
{
    public interface IConvertService
    {
        public string DataTableToJSONWithStringBuilder(DataTable table);
        public List<string> ConvertTableToAlias(List<string> table);
        public List<string> ConvertColumnToAlias(List<string> columns);
        public List<Alias> FindFromColumnAliases(List<string> columnAliases);
        public string DataTableToJSONWithStringBuilderUnaliased(DataTable table);
    }
}
