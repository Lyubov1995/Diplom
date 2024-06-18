using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBase.Models
{
    public class Images
    {

        [Required]
        public required string Url { get; set; }

        [ForeignKey("Rooms")]
        public int RoomId { get; set; }
        public required Rooms Room { get; set; }

    }
}
