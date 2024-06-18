using DataBase.Models;
using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;

namespace WebClients.Models
{
    public class BookingModel
    {
        [Required]
        public DateOnly DateOfArrival { get; set; }

        [Required]
        public DateOnly DepartureDate { get; set; }

        [Required]
        public int NumberOfPeople { get; set; }

        public int? NumberOfChildren { get; set; }

        public int? Prepayment { get; set; }

        public string? Cheque { get; set; }
        public int? Cost { get; set; }
        public int? Discount { get; set; }

        public Rooms Room { get; set; }

        public SearchModel SearchModel { get; set; }
    }
}
