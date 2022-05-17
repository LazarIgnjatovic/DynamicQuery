using System;
using System.Collections.Generic;

namespace AWExplore.Models
{
    public partial class Alias
    {
        public int AliasId { get; set; }
        public string TableName { get; set; }
        public string TableAlias { get; set; }
        public string TableAbbr { get; set; }
        public bool TableIgnore { get; set; }
        public string ColumnName { get; set; }
        public string ColumnAlias { get; set; }
        public bool? ColumnIgnore { get; set; }
    }
}
