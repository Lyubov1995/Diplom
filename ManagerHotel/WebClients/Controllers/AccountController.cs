using DataBase.Data;
using DataBase.Models;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
using WebClients.Models;
using static WebClients.Models.FilterSortPagingApp;

namespace WebClients.Controllers
{

    [Authorize]
    public class AccountController : Controller
    {
        private ApplicationDbContext _context;
        public AccountController(ApplicationDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public async Task<IActionResult> PersonalAccount(int page = 1)
        {
            int pageSize = 5;
            if (User.Identity.IsAuthenticated)
            {
                Users _user = await _context.Users.FirstOrDefaultAsync(p => p.Email == User.Identity.Name);
                IQueryable<Employment> _employment = _context.Employment.Where(p => p.UserId == _user.Id).Include(x => x.Rooms.RoomsCategory).Include(x => x.Status);
                foreach (var i in _employment)
                {
                    if (i.DateOfArrival < DateOnly.FromDateTime(DateTime.Now) && i.StatusId == 1)
                    {
                        i.StatusId = 3;
                        _context.SaveChanges();
                    }
                }
                var Kolvo = await _employment.CountAsync();
                var employment = await _employment.Skip((page - 1) * pageSize).Take(pageSize).ToListAsync();

                PersonalAccModel viewModel = new PersonalAccModel
                {
                    User = _user,
                    Employment = employment,
                    PageViewModel = new PageViewModel(Kolvo, page, pageSize),
                };
                return View(viewModel);
            }
            return NotFound();
        }

        public async Task<ActionResult> BookingEdit(int id)
        {
            if (User.Identity.IsAuthenticated)
            {
                Users _user = await _context.Users.FirstOrDefaultAsync(p => p.Email == User.Identity.Name);
                Employment _employment = _context.Employment.FirstOrDefault(p => p.Id == id);
                if (_employment == null)
                {
                    return View("NotFound");
                }
                else
                {
                    _employment.StatusId = 2;
                    _context.SaveChanges();
                    IEnumerable<Employment> Employment = await _context.Employment.Where(u => u.UserId == _user.Id && u.Status.Name != "Отменена").ToListAsync();
                    if (Employment.Count() >= 5 && Employment.Count() < 15)
                    {
                        _user.Discount = 5;
                    }
                    if (Employment.Count() >= 15 && Employment.Count() < 35)
                    {
                        _user.Discount = 10;
                    }
                    if (Employment.Count() >= 35)
                    {
                        _user.Discount = 20;
                    }
                    if (Employment.Count() < 5)
                    {
                        _user.Discount = 0;
                    }
                    _context.SaveChanges();
                    return RedirectToAction("PersonalAccount");
                }
            }
            return NotFound();
        }

        public IActionResult PersonalDataEdit(EditViewModel model)
        {
            return View(model);
        }

        [HttpPost]
        public async Task<IActionResult> PersonalDataEdit(EditViewModel model, int id)
        {
            Users user = await _context.Users.FirstOrDefaultAsync(u => u.Id == model.Id);
            if (user != null)
            {
                if (model.Name == null || model.Email == null || model.Phone == null)
                {
                    return View(model);
                }
                if (!(model.Email.Contains("@gmail") || model.Email.Contains("@mail") || model.Email.Contains("@yandex") || model.Email.Contains("@inbox") || model.Email.Contains("@ok") || model.Email.Contains("@rambler")))
                {
                    ModelState.AddModelError("Email", "Email должен содержать @gmail/@mail/@yandex/@inbox/@ok/@rambler");
                    return View(model);
                }
                if (!(model.Email.Contains(".com") || model.Email.Contains(".ru")))
                {
                    ModelState.AddModelError("Email", "Email должен содержать .com/.ru");
                    return View(model);
                }
                if (!(model.Phone.Contains("(8") || model.Phone.Contains("(9")))
                {
                    ModelState.AddModelError("Phone", "Телефон введен некорректно. Он должен содержать +79/+78");
                    return View(model);
                }
                else if (model.Phone.Length < 18)
                {
                    ModelState.AddModelError("Phone", "Телефон введен некорректно");
                    return View(model);
                }
                else
                {
                    user.Name = model.Name;
                    user.Phone = model.Phone;
                    var Email = user.Email;
                    user.Email = model.Email;
                    if (Email != user.Email)
                    {
                        Users user1 = await _context.Users.FirstOrDefaultAsync(u => u.Email == user.Email);

                        if (user1 == null || user== user1)
                        {
                            _context.SaveChanges();
                            await Authenticate(user);
                        }
                        else
                        {
                            ModelState.AddModelError("Email", "Пользователь с такой электронной почтой уже существует. Измените почту");
                            return View(model);
                        }
                    }
                    else
                    {
                        _context.SaveChanges();
                        await Authenticate(user);
                    }
                    if (model.NewPassword != null)
                    {
                        if (model.ConfirmPassword != null)
                        {
                            if (model.ConfirmPassword == model.NewPassword)
                            {
                                user.Password = model.NewPassword;
                                _context.SaveChanges();
                                await Authenticate(user);
                            }
                            else
                            {
                                ModelState.AddModelError("NewPassword", "Пароли не совпадают");
                                return View(model);
                            }
                        }
                        else
                        {
                            return View(model);
                        }
                    }
                    return RedirectToAction("PersonalAccount");
                }
                return View(model);
            }
            return View(model);
        }

        [HttpGet]
        [AllowAnonymous]
        public IActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(LoginViewModel model, SearchModel searchModel, string Booking, int RoomOnTheFloor)
        {
            Users user = await _context.Users.FirstOrDefaultAsync(u => u.Email == model.Email && u.Password == model.Password);
            if (user != null)
            {
                if (Booking == "Yes")
                {
                    await Authenticate(user);
                    return RedirectToAction("Details", "Accommodations", new { DateOfArrival = searchModel.DateOfArrival, DepartureDate = searchModel.DepartureDate, CountPeople = searchModel.CountPeople, CountChildren = searchModel.CountChildren, RoomOnTheFloor = RoomOnTheFloor });
                }
                await Authenticate(user);
                return RedirectToAction("Index", "Home");
            }
            ModelState.AddModelError("Password", "Некорректные логин и(или) пароль");
            return View(model);
        }

        [HttpGet]
        [AllowAnonymous]
        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Register(RegisterViewModel model)
        {
            if (model.Email != null)
            {
                if (model.Name == null || model.Password == null || model.ConfirmPassword == null || model.Phone == null)
                {
                    return View(model);
                }
                else
                {
                    if (!(model.Email.Contains("@gmail") || model.Email.Contains("@mail") || model.Email.Contains("@yandex") || model.Email.Contains("@inbox") || model.Email.Contains("@ok") || model.Email.Contains("@rambler")))
                    {
                        ModelState.AddModelError("Email", "Email должен содержать @gmail/@mail/@yandex/@inbox/@ok/@rambler");
                    }
                    if (!(model.Email.Contains(".com") || model.Email.Contains(".ru")))
                    {
                        ModelState.AddModelError("Email", "Email должен содержать .com/.ru");
                    }
                    if (!(model.Phone.Contains("(8") || model.Phone.Contains("(9")))
                    {
                        ModelState.AddModelError("Phone", "Телефон введен некорректно. Он должен содержать +79/+78");
                    }
                    else
                    {
                        Users user = await _context.Users.FirstOrDefaultAsync(u => u.Email == model.Email);
                        if (user == null)
                        {
                            if (model.Password != model.ConfirmPassword)
                            {
                                ModelState.AddModelError("ConfirmPassword", "Пароль и пароль для подтверждения не совпадают.");
                            }
                            else
                            {
                                user = new Users { Name = model.Name, Email = model.Email, Phone = model.Phone, Password = model.Password };
                                Roles userRole = await _context.Roles.FirstOrDefaultAsync(r => r.Name == "Клиент");
                                if (userRole != null)
                                    user.RoleId = userRole.Id;
                                user.Discount = 0;
                                _context.Users.Add(user);
                                await _context.SaveChangesAsync();
                                await Authenticate(user);
                                return RedirectToAction("Index", "Home");
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("Email", "Пользователь с такой электронной почтой уже существует");
                            return View(model);
                        }
                    }
                    return View(model);
                }
            }
            return View(model);
        }


        [HttpGet]
        [AllowAnonymous]
        public IActionResult ForgotPassword()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ForgotPassword(ForgotDataViewModel model)
        {
            if (model.Email != null)
            {
                if (model.Password == null || model.ConfirmPassword == null)
                {
                    return View(model);
                }
                else
                {
                    if (!(model.Email.Contains("@gmail") || model.Email.Contains("@mail") || model.Email.Contains("@yandex") || model.Email.Contains("@inbox") || model.Email.Contains("@ok") || model.Email.Contains("@rambler")))
                    {
                        ModelState.AddModelError("Email", "Email должен содержать @gmail/@mail/@yandex/@inbox/@ok/@rambler");
                    }
                    if (!(model.Email.Contains(".com") || model.Email.Contains(".ru")))
                    {
                        ModelState.AddModelError("Email", "Email должен содержать .com/.ru");
                    }
                    else
                    {
                        Users user = await _context.Users.FirstOrDefaultAsync(u => u.Email == model.Email);
                        if (user != null)
                        {
                            if (model.Password != model.ConfirmPassword)
                            {
                                ModelState.AddModelError("ConfirmPassword", "Пароль и пароль для подтверждения не совпадают.");
                            }
                            else
                            {
                                user.Password = model.Password;
                                _context.SaveChanges();
                                return RedirectToAction("Login");
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("Email", "Пользователь с такой электронной почтой не найден");
                            return View(model);
                        }
                    }
                    return View(model);
                }
            }
            return View(model);
        }


        [HttpGet]
        [AllowAnonymous]
        public IActionResult ForgotEmail()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> ForgotEmail(ForgotDataViewModel model)
        {
            if (model.Phone != null)
            {
                if (model.Email == null)
                {
                    return View(model);
                }
                else
                {
                    if (!(model.Phone.Contains("(8") || model.Phone.Contains("(9")))
                    {
                        ModelState.AddModelError("Phone", "Телефон введен некорректно. Он должен содержать +79/+78");
                    }
                    if (!(model.Email.Contains("@gmail") || model.Email.Contains("@mail") || model.Email.Contains("@yandex") || model.Email.Contains("@inbox") || model.Email.Contains("@ok") || model.Email.Contains("@rambler")))
                    {
                        ModelState.AddModelError("Email", "Email должен содержать @gmail/@mail/@yandex/@inbox/@ok/@rambler");
                    }
                    if (!(model.Email.Contains(".com") || model.Email.Contains(".ru")))
                    {
                        ModelState.AddModelError("Email", "Email должен содержать .com/.ru");
                    }
                    else
                    {
                        Users user = await _context.Users.FirstOrDefaultAsync(u => u.Phone == model.Phone);
                        Users user1 = await _context.Users.FirstOrDefaultAsync(u => u.Email == model.Email);
                        if (user != null)
                        {
                            if (user != user1)
                            {
                                if (user1 == null)
                                {
                                    user.Email = model.Email;
                                    _context.SaveChanges();
                                    return RedirectToAction("Login");
                                }
                                else
                                {
                                    ModelState.AddModelError("Email", "Данный Email привязан к другому аккаунту");
                                }
                            }
                            else
                            {
                                ModelState.AddModelError("Email", "Email привязан к вашему аккаунту. Пожалуйста, перейдите на страницу авторизации!");
                            }
                        }
                        else
                        {
                            ModelState.AddModelError("Phone", "Пользователь с таким телефоном не найден");
                        }
                    }
                    return View(model);
                }
            }
            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync();
            return RedirectToAction("Index", "Home");
        }

        private async Task Authenticate(Users user)
        {
            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.Name, user.Email)
            };
            ClaimsIdentity id = new ClaimsIdentity(claims, "ApplicationCookie", ClaimsIdentity.DefaultNameClaimType,
            ClaimsIdentity.DefaultRoleClaimType);
            await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(id));
        }

    }
}