using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBase.Models
{
    public class Employment
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [ForeignKey("Rooms")]
        public int? RoomId { get; set; }
        public Rooms Rooms { get; set; }

        [Required]
        public DateTime BookingDate { get; set; }

        [Required]
        public DateOnly DateOfArrival { get; set; }

        [Required]
        public DateOnly DepartureDate { get; set; }

        [ForeignKey("Users")]
        public int? UserId { get; set; }
        public Users Users { get; set; } 

        [Required]
        public int NumberOfPeople { get; set; }
        public int? NumberOfChildren { get; set; }
       
      
        public int? Cost { get; set; }
        public int? Prepayment { get; set; }
        
        public string? Cheque { get; set; }
      
        [ForeignKey("Status")]
        public int? StatusId { get; set; }
        public Status Status { get; set; }
       
    }
}
