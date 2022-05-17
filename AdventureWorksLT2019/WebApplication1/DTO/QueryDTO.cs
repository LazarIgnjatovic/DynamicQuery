using System.Collections.Generic;

namespace AWExplore.DTO
{
    public class QueryDTO
    {
        public List<string> SelectedFields { get; set; }
        public List<string> GroupFields { get; set; }
        public List<string> OrderFields { get; set; }
        public bool IsAscending { get; set; }

    }
}
