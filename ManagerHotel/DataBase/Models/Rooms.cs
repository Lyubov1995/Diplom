using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBase.Models
{
    public class Rooms
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int RoomOnTheFloor { get; set; }
       
        [Required]
        public string MainPhoto { get; set; }

        [ForeignKey("RoomsCategory")]
        public int CategoryId { get; set; }

        public required RoomsCategory RoomsCategory { get; set; }


    }
}
