using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataBase.Models
{
    public class Accommodation
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        [ForeignKey("Users")]
        public int UserId { get; set; }
        public required Users Users { get; set; }
      
        [ForeignKey("Habitation")]
        public int HabitationId { get; set; }
        public required Habitation Habitation { get; set; }
        [Required]
        public string Name { get; set; }

        [Required]
        public string Surname { get; set; }

        [Required]
        public string? Patronymic { get; set; }

        public string? PassportData { get; set; }

        public string? InternationalPassport { get; set; }

        public string? BirthCertificate { get; set; }

        public string? Registration { get; set; }

        [Required]
        public DateTime DateOfBirth { get; set; }

        [Required]
        public string? Phone { get; set; }

    }

}
