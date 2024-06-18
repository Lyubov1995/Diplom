using DataBase.Models;
using System.ComponentModel.DataAnnotations;
namespace WebClients.Models
{
    public class AccommodationModel
    {
        public class RoomsModel
        {
            public Rooms Room { get; set; }
            public RoomPrice RoomPrice { get; set; }
            public IEnumerable<Images> Images { get; set; }
            public string Return { get; set; }
            public SearchModel SearchModel { get; set; }
        }
    }

    public class SearchModel
    {
        public DateOnly DateOfArrival { get; set; }
        public DateOnly DepartureDate { get; set; }
        public int CountPeople { get; set; }
        public int CountChildren { get; set; }
        public int Cost { get; set; }
        public IndexModel? indexModel { get; set; }
    }
}
