using DataBase.Models;
using Microsoft.AspNetCore.Mvc.Rendering;
using static WebClients.Models.FilterSortPagingApp;

namespace WebClients.Models
{
    public class FilterSortPagingApp
    {
        public class PageViewModel
        {
            public int PageNumber { get; private set; }
            public int TotalPages { get; private set; }

            public PageViewModel(int count, int pageNumber, int pageSize)
            {
                PageNumber = pageNumber;
                TotalPages = (int)Math.Ceiling(count / (double)pageSize);
            }

            public bool HasPreviousPage
            {
                get
                {
                    return (PageNumber > 1);
                }
            }

            public bool HasNextPage
            {
                get
                {
                    return (PageNumber < TotalPages);
                }
            }
        }
    }
    
    public class FilterViewModel
    {
        public FilterViewModel(List<RoomsCategory> categories, int id)
        {
            categories.Insert(0, new RoomsCategory { Name = "Все", Id = 0 });
            Category = new SelectList(categories, "Id", "Name", id);
            SelectedCategory = id;
        }
        public SelectList Category { get; set; } 
        public int SelectedCategory { get; set; } 
    }

    public class Count
    {
        public Count(List<string> counts)
        {
            Category = new SelectList(counts);
        }
        public SelectList Category { get; set; }
    }

    public class IndexModel
    {
        public IEnumerable<Rooms> Room { get; set; }
        public PageViewModel? PageViewModel { get; set; }
        public IEnumerable<RoomPrice> RoomPrice { get; set; }
        public FilterViewModel FilterViewModel { get; set; }
        public IEnumerable<Employment> Employment { get; set; }

    }

}
