using AWExplore.Config;
using Microsoft.Data.SqlClient;
using System.Collections.Generic;
using System.Data;

namespace AWExplore.Services
{
    public class SQLService :ISQLService
    {
        public DataTable ExecuteQuery(string queryString, IDBSettings dbSettings)
        {
            var conn = new SqlConnection(dbSettings.ConnectionString);
            SqlCommand com = new SqlCommand { Connection = conn, CommandText = queryString };

            conn.Open();
            var dt = new DataTable();
            dt.Load(com.ExecuteReader());
            conn.Close();

            return dt; 
        }

        public DataTable ExecuteParametrizedQuery(string queryString, IDBSettings dbSettings, List<SqlParameter> parameters)
        {
            var conn = new SqlConnection(dbSettings.ConnectionString);
            SqlCommand com = new SqlCommand { Connection = conn, CommandText = queryString };

            foreach (SqlParameter param in parameters)
            {
                com.Parameters.Add(param);
            }
            try
            {
                if (conn.State != ConnectionState.Open)
                    conn.Open();
                var dt = new DataTable();
                dt.Load(com.ExecuteReader());
                return dt;
            }
            finally
            {
                conn.Close();
            }
        }
    }
}
