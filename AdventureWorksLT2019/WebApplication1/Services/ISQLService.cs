using AWExplore.Config;
using Microsoft.Data.SqlClient;
using System.Collections.Generic;
using System.Data;

namespace AWExplore.Services
{
    public interface ISQLService
    {
        public DataTable ExecuteQuery(string queryString, IDBSettings dbSettings);
        public DataTable ExecuteParametrizedQuery(string queryString, IDBSettings dbSettings, List<SqlParameter> parameters);
    }
}
