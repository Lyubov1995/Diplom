using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBase.Models
{
    public class Habitation
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [ForeignKey("Rooms")]
  
        public int RoomId { get; set; }
        public Rooms? Rooms { get; set; }
        

        [Required]
        public DateTime DateStart { get; set; }

        [Required]
        public DateTime DateEnd { get; set; }

        [ForeignKey("Users")]
        public int UserId { get; set; }
        public required Users Users { get; set; }
        

        [ForeignKey("Employment")]
        public int EmploymentId { get; set; }
        public Employment? Employment { get; set; }
       

        [ForeignKey("Status")]
        public int StatustId { get; set; }
        public required Status Status { get; set; }

        public int? Payment { get; set; }
    }
}
