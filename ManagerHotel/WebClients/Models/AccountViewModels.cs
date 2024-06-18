using DataBase.Models;
using System.ComponentModel.DataAnnotations;
using static WebClients.Models.FilterSortPagingApp;

namespace WebClients.Models
{
    public class LoginViewModel
    {
        [Required(ErrorMessage = "Не указан Email")]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Не указан Пароль")]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }
    }

    public class RegisterViewModel
    {
        [Required(ErrorMessage = "Не указано Имя")]
        [StringLength(100, ErrorMessage = "Длина Имени должна составлять не менее {2} символов.", MinimumLength = 2)]
        [Display(Name = "Name")]
        public string Name { get; set; }
        
        [Required(ErrorMessage = "Не указан Email")]
        [Display(Name = "Email")]
        public string Email { get; set; }
        
        [Required(ErrorMessage = "Не указан Телефон")]
        [StringLength(100, ErrorMessage = "Телефон введен некорректно", MinimumLength = 18)]
        [DataType(DataType.PhoneNumber)]
        [Display(Name = "Phone")]
        public string Phone { get; set; }

        [Required(ErrorMessage = "Не указан пароль")]
        [StringLength(100, ErrorMessage = "Длина Пароля должна составлять не менее {2} символов.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [Required(ErrorMessage = "Повторите пароль")]
        [Compare("Password", ErrorMessage = "Пароль и пароль для подтверждения не совпадают.")]
        public string ConfirmPassword { get; set; }
    }

    public class ForgotDataViewModel
    {
        [Required(ErrorMessage = "Не указан Телефон")]
        [StringLength(100, ErrorMessage = "Телефон введен некорректно", MinimumLength = 18)]
        [DataType(DataType.PhoneNumber)]
        [Display(Name = "Phone")]
        public string Phone { get; set; }
        
        [Required(ErrorMessage = "Не указан Email")]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Не указан пароль")]
        [StringLength(100, ErrorMessage = "Длина Пароля должна составлять не менее {2} символов.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "Password")]
        public string Password { get; set; }

        [DataType(DataType.Password)]
        [Display(Name = "Confirm password")]
        [Required(ErrorMessage = "Повторите пароль")]
        [Compare("Password", ErrorMessage = "Пароль и пароль для подтверждения не совпадают.")]
        public string ConfirmPassword { get; set; }
    }

    public class PersonalAccModel
    {
        public Users User { get; set; }
        public IEnumerable<Employment> Employment { get; set; }
        public PageViewModel? PageViewModel { get; set; }
    }

    public class EditViewModel
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "Не указано Имя")]
        [StringLength(100, ErrorMessage = "Длина Имени должна составлять не менее {2} символов.", MinimumLength = 2)]
        [Display(Name = "Name")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Не указан Email")]
        [Display(Name = "Email")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Не указан Телефон")]
        [StringLength(100, ErrorMessage = "Телефон введен некорректно", MinimumLength = 18)]
        [DataType(DataType.PhoneNumber)]
        [Display(Name = "Phone")]
        public string Phone { get; set; }

        [StringLength(100, ErrorMessage = "Длина Пароля должна составлять не менее {2} символов.", MinimumLength = 6)]
        [DataType(DataType.Password)]
        [Display(Name = "NewPassword")]
        public string? NewPassword { get; set; }
 
        [DataType(DataType.Password)]
        [Display(Name = "ConfirmPassword")]
        public string? ConfirmPassword { get; set; }
    }
}
