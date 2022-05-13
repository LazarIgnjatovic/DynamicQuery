using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AWExplore.Config
{
    public interface IDBSettings
    {
        string ConnectionString { get; set; }
        string Schema { get; set; }
    }
}
