using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;
using WebClients.Models;

namespace WebClients.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index(SearchModel model)
        {
            model.DateOfArrival = DateOnly.FromDateTime(DateTime.Now);
            model.DepartureDate = DateOnly.FromDateTime(DateTime.Now).AddDays(1);
            return View(model);
        }

        public IActionResult About()
        {
            return View();
        }
        public IActionResult SpecialOffers()
        {
            return View();
        }
       
        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
