using System.Data;

namespace AWExplore.Services
{
    public interface IConvertService
    {
        public string DataTableToJSONWithStringBuilder(DataTable table);
    }
}
