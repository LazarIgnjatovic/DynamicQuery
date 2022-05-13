using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AWExplore.Config
{
    public class DBSettings: IDBSettings
    {
        public string ConnectionString { get; set; }
        public string Schema { get; set; }
    }
}
