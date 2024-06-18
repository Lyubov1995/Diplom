using DataBase.Data;
using DataBase.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WebClients.Models;
using static WebClients.Models.FilterSortPagingApp;
using static WebClients.Models.AccommodationModel;
using System.Globalization;
using System.Data;
using DinkToPdf.Contracts;
using DinkToPdf;
using WebClients.TagHelpers;
using System.Text;

namespace WebClients.Controllers
{
    public class AccommodationsController : Controller
    {
        private ApplicationDbContext _context;
        private IConverter _converter;

        public IConfiguration Configuration;
        IWebHostEnvironment webHostEnvironment;
        
        public AccommodationsController(ApplicationDbContext context, IConverter converter, IConfiguration configuration, IWebHostEnvironment environment)
        {
            _converter = converter;
            _context = context;
            Configuration = configuration;
            webHostEnvironment = environment;
        }

        public async Task<IActionResult> RoomsIndex(int Id, SearchModel model, DateOnly DateOfArrival, DateOnly DepartureDate, int page = 1)
        {
            DateOnly someDate = new DateOnly(0001, 1, 1);
            int pageSize = 6;

            if (model.DateOfArrival == someDate)
            {
                model.DateOfArrival = DateOnly.FromDateTime(DateTime.Now);
            }

            if (model.DepartureDate == someDate)
            {
                model.DepartureDate = DateOnly.FromDateTime(DateTime.Now).AddDays(1);
            }

            if (model.CountPeople == 0)
            {
                model.CountPeople = 1;
            }
            if (DateOfArrival != someDate)
            {
                model.DateOfArrival = DateOfArrival;

            }
            if (DepartureDate != someDate)
            {
                model.DepartureDate = DepartureDate;
            }

            DateTime date1 = new DateTime(model.DateOfArrival.Year, model.DateOfArrival.Month, model.DateOfArrival.Day, 0, 0, 0);
            DateTime date2 = new DateTime(model.DepartureDate.Year, model.DepartureDate.Month, model.DepartureDate.Day, 0, 0, 0);

            IQueryable<RoomsCategory> _roomsCategory = _context.RoomsCategory.Where(x => x.MaxNumberOfPeople >= model.CountPeople + model.CountChildren && x.MinNumberOfPeople <= model.CountPeople + model.CountChildren);
            IQueryable<Rooms> _rooms = _context.Rooms.FromSqlRaw(@$"SELECT * FROM Rooms WHERE NOT EXISTS (SELECT * FROM Employment WHERE Employment.RoomId = Rooms.RoomOnTheFloor and Employment.StatusId != 2 and
            '{date1.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)}' <= Employment.DateOfArrival and ('{date2.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)}' != Employment.DepartureDate or
            '{date2.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)}'<= Employment.DepartureDate))")
            .Include(x => x.RoomsCategory).Where(p => p.RoomsCategory.MaxNumberOfPeople >= model.CountPeople + model.CountChildren && p.RoomsCategory.MinNumberOfPeople <= model.CountPeople + model.CountChildren);

            IQueryable<RoomPrice> _price = _context.RoomPrice.Include(x => x.RoomsCategory).Where(x => date1 >= x.DateStartOfPeriod && date1 <= x.DateEndOfPeriod);

            //Сортировка по цене
            switch (model.Cost)
            {
                case 0:
                    _rooms = _rooms;
                    break;
                case 1:
                    _rooms = _context.Rooms.FromSqlRaw(@$"SELECT * FROM Rooms Full JOIN
                    RoomsCategory on Rooms.CategoryId =RoomsCategory.Id
                    Full JOIN RoomPrice on RoomPrice.IdCategory = RoomsCategory.Id
                    WHERE '{date1.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)}' >= RoomPrice.DateStartOfPeriod and
                    '{date1.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)}' <= RoomPrice.DateEndOfPeriod and
                    NOT EXISTS (SELECT * FROM Employment WHERE Employment.RoomId = Rooms.RoomOnTheFloor and Employment.StatusId != 2 and
                    '{date1.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)}' <= Employment.DateOfArrival and ('{date2.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)}' != Employment.DepartureDate or
                    '{date2.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)}'<= Employment.DepartureDate))
                    ORDER BY MainPrice OFFSET 0 ROWS")
                    .Include(x => x.RoomsCategory).Where(p => p.RoomsCategory.MaxNumberOfPeople >= model.CountPeople + model.CountChildren);
                    break;
                case 2:
                    _rooms = _context.Rooms.FromSqlRaw(@$"SELECT * FROM Rooms Full JOIN
                    RoomsCategory on Rooms.CategoryId =RoomsCategory.Id
                    Full JOIN RoomPrice on RoomPrice.IdCategory = RoomsCategory.Id
                    WHERE '{date1.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)}' >= RoomPrice.DateStartOfPeriod and
                    '{date1.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)}' <= RoomPrice.DateEndOfPeriod and
                    NOT EXISTS (SELECT * FROM Employment WHERE Employment.RoomId = Rooms.RoomOnTheFloor and Employment.StatusId != 2 and
                    '{date1.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)}' <= Employment.DateOfArrival and ('{date2.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)}' != Employment.DepartureDate or
                    '{date2.ToString("yyyy-MM-dd", CultureInfo.InvariantCulture)}' <= Employment.DepartureDate))
                    ORDER BY MainPrice DESC OFFSET 0 ROWS")
                    .Include(x => x.RoomsCategory).Where(p => p.RoomsCategory.MaxNumberOfPeople >= model.CountPeople + model.CountChildren);
                    break;
            }

            // Фильтрация по категории
            if (Id != 0)
            {
                _rooms = _rooms.Where(p => p.CategoryId == Id);
            }

            // Пагинация
            var Kolvo = await _rooms.CountAsync();
            var rooms = await _rooms.Skip((page - 1) * pageSize).Take(pageSize).ToListAsync();

            IndexModel viewModel = new IndexModel
            {
                Room = rooms,
                PageViewModel = new PageViewModel(Kolvo, page, pageSize),
                FilterViewModel = new FilterViewModel(_roomsCategory.ToList(), Id),
                RoomPrice = _price,
            };

            SearchModel view = new SearchModel
            {
                DateOfArrival = model.DateOfArrival,
                DepartureDate = model.DepartureDate,
                CountPeople = model.CountPeople,
                CountChildren = model.CountChildren,
                Cost = model.Cost,
                indexModel = viewModel
            };
            return View(view);
        }

        public async Task<IActionResult> Details(int RoomOnTheFloor, SearchModel m, string Return)
        {
            DateTime date1 = new DateTime(m.DateOfArrival.Year, m.DateOfArrival.Month, m.DateOfArrival.Day, 0, 0, 0);
            DateTime date2 = new DateTime(m.DepartureDate.Year, m.DepartureDate.Month, m.DepartureDate.Day, 0, 0, 0);

            if (RoomOnTheFloor != 0)
            {
                Rooms _room = await _context.Rooms.Include(x => x.RoomsCategory).FirstOrDefaultAsync(p => p.RoomOnTheFloor == RoomOnTheFloor);
                RoomPrice _price = await _context.RoomPrice.Include(x => x.RoomsCategory).Where(x => date1 >= x.DateStartOfPeriod && date1 <= x.DateEndOfPeriod).FirstOrDefaultAsync(p => p.IdCategory == _room.CategoryId);
                IEnumerable<Images> _images = await _context.Images.Where(x => x.RoomId == _room.RoomOnTheFloor).ToListAsync();
                
                //если пытаются забронировать занятый номер
                if (Return == "Yes")
                {
                    SearchModel view = new SearchModel
                    {
                        DateOfArrival = m.DateOfArrival,
                        DepartureDate = m.DepartureDate,
                        CountPeople = m.CountPeople,
                        CountChildren = m.CountChildren,
                    };
                    RoomsModel viewModel = new RoomsModel
                    {
                        Room = _room,
                        RoomPrice = _price,
                        Images = _images,
                        SearchModel = view,
                        Return = Return
                    };
                    return View(viewModel);
                }
                else
                {
                    SearchModel view = new SearchModel
                    {
                        DateOfArrival = m.DateOfArrival,
                        DepartureDate = m.DepartureDate,
                        CountPeople = m.CountPeople,
                        CountChildren = m.CountChildren,
                    };
                    RoomsModel viewModel = new RoomsModel
                    {
                        Room = _room,
                        RoomPrice = _price,
                        Images = _images,
                        SearchModel = view
                    };
                    return View(viewModel);
                }
            }
            return NotFound();
        }


        public async Task<IActionResult> Prepayment(int RoomOnTheFloor, SearchModel model, int? Price, string Pay)
        {
            if (RoomOnTheFloor != 0)
            {
                Rooms _room = await _context.Rooms.Include(x => x.RoomsCategory).FirstOrDefaultAsync(p => p.RoomOnTheFloor == RoomOnTheFloor);
                int days = 0;
                Users _user = await _context.Users.FirstOrDefaultAsync(p => p.Email == User.Identity.Name);
                RoomPrice _price = null;
                int TotalCost = 0;
                int prepayment = 0;

                DateTime date1 = new DateTime(model.DateOfArrival.Year, model.DateOfArrival.Month, model.DateOfArrival.Day, 0, 0, 0);
                DateTime date2 = new DateTime(model.DepartureDate.Year, model.DepartureDate.Month, model.DepartureDate.Day, 0, 0, 0);
                
                Employment _Employment = await _context.Employment.FirstOrDefaultAsync(u => model.DateOfArrival <= u.DateOfArrival && (model.DepartureDate != u.DepartureDate || model.DepartureDate <= u.DepartureDate) && u.RoomId == RoomOnTheFloor && u.StatusId != 2);

                var ID = _context.Employment.ToList().Max(point => point.Id) + 1;
                if (_Employment == null)
                {
                    //Процесс предоплаты
                    if (Pay == "Yes")
                    {
                        model.Cost = (int)Price;
                        Employee _employee = await _context.Employee.FirstOrDefaultAsync(p => p.Roles.Name == "Менеджер");
                        var htmlDoc = new StringBuilder();
                        htmlDoc.AppendLine("<td>");
                        var path = webHostEnvironment.WebRootPath + "\\doc.jpg";
                        htmlDoc.AppendLine($"<img src=\"{path}\" />");
                        htmlDoc.AppendLine("</td>");
                        
                        //формирование чека в PDF
                        var globalSettings = new GlobalSettings
                        {
                            ColorMode = ColorMode.Color,
                            Orientation = Orientation.Portrait,
                            PaperSize = PaperKind.A4,
                            Margins = new MarginSettings { Top = 10 },
                            DocumentTitle = "PDF Report",
                            Out =
                        @"wwwroot\document\PDF\" + _user.Id + ID + ".pdf"
                        };
                        var objectSettings = new ObjectSettings
                        {
                            PagesCount = true,
                            HtmlContent = TemplateGenerator.GetHTMLString(model, _room.RoomsCategory.Name, _user.Name, _user.Discount, _employee.Name, _employee.Surname, _employee.Patronymic)
                        + htmlDoc.ToString(),
                            WebSettings = { DefaultEncoding = "utf-8", UserStyleSheet = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/css", "site.css") },
                            HeaderSettings = { FontName = "Arial", FontSize = 9, Right = "Страница [page] / [toPage]", Line = true },
                            FooterSettings = { FontName = "Arial", FontSize = 9, Line = true, Center = "Конец документа" }
                        };
                        var pdf = new HtmlToPdfDocument()
                        {
                            GlobalSettings = globalSettings,
                            Objects = { objectSettings }
                        };
                        var file = _converter.Convert(pdf);
                        _Employment = new Employment
                        {
                            RoomId = RoomOnTheFloor,
                            BookingDate = DateTime.Now,
                            DateOfArrival = model.DateOfArrival,
                            DepartureDate = model.DepartureDate,
                            UserId = _user.Id,
                            NumberOfPeople = model.CountPeople,
                            NumberOfChildren = model.CountChildren,
                            Cost = Price,
                            Prepayment = (int)(Price * 0.3),
                            Cheque = "" + _user.Id + "" + ID + ".pdf"
                        };

                        Status status = await _context.Status.FirstOrDefaultAsync(r => r.Name == "Активна");
                        if (status != null)
                            _Employment.StatusId = status.Id;
                        _context.Employment.Add(_Employment);
                        await _context.SaveChangesAsync();
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
                        await _context.SaveChangesAsync();
                        return RedirectToAction("PersonalAccount", "Account");
                    }

                    else
                    {
                        days = (date2 - date1).Days;
                        _price = await _context.RoomPrice.Include(x => x.RoomsCategory).Where(x => date1 >= x.DateStartOfPeriod && date1 <= x.DateEndOfPeriod).FirstOrDefaultAsync(p => p.IdCategory == _room.CategoryId);
                        if (_room.RoomsCategory.MaxNumberOfPeople != model.CountPeople + model.CountChildren)
                        {
                            Price = Price - ((_room.RoomsCategory.MaxNumberOfPeople - (model.CountPeople + model.CountChildren)) * _price.LessPrice);
                        }
                        TotalCost = (int)(Price * days - (Price * _user.Discount * 0.1));
                        model.Cost = (int)TotalCost;
                        prepayment = (int)(TotalCost * 0.3);

                        SearchModel view = new SearchModel
                        {
                            DateOfArrival = model.DateOfArrival,
                            DepartureDate = model.DepartureDate,
                            CountPeople = model.CountPeople,
                            CountChildren = model.CountChildren,
                        };
                        BookingModel viewModel = new BookingModel
                        {
                            Room = _room,
                            DateOfArrival = view.DateOfArrival,
                            DepartureDate = view.DepartureDate,
                            NumberOfPeople = view.CountPeople,
                            NumberOfChildren = view.CountChildren,
                            Prepayment = (int)prepayment,
                            Cheque = "null",
                            Cost = model.Cost,
                            Discount = _user.Discount,
                            SearchModel = view,
                        };
                        return View(viewModel);
                    }
                }
                else
                {
                    string Return = "Yes";
                    return RedirectToAction("Details", "Accommodations", new { DateOfArrival = model.DateOfArrival, DepartureDate = model.DepartureDate, CountPeople = model.CountPeople, CountChildren = model.CountChildren, RoomOnTheFloor = RoomOnTheFloor, Return = Return });
                }
            }
            return NotFound();
        }
    }
}