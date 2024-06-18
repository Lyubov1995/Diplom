using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBase.Models
{
    public class RoomPrice
    {

        [Required]
        public DateTime DateStartOfPeriod { get; set; }
       
        [Required]
        public DateTime DateEndOfPeriod { get; set; }

        [Required]
        public int MainPrice { get; set; }
 
        public int? LessPrice { get; set; }

        [ForeignKey("RoomsCategory")]
        public int IdCategory { get; set; }
        public required RoomsCategory RoomsCategory { get; set; }
    
    }
}
