using DataBase.Models;
using System.Text;
using WebClients.Models;

namespace WebClients.TagHelpers
{
    public class TemplateGenerator
    {
        public static string GetHTMLString(SearchModel model, string Room, string NameUser, int? Discount, string NameManager, string ManagerSurname, string ManagerPatronymic)
        {
            var sb = new StringBuilder();
            sb.AppendFormat($@"
                 <html>
                 <head>
                 </head>
                 <body>
                 <div class='header' style='text-align:center'><h1>Информация о бронировании</h1></div>
                 <div >
                 <div class='receipt'>
                 <h2 class='receipt-heading'>Имя клиента: {NameUser}</h2>
                 <div>
                 <table class='table11'>
                 <tr>
                 <td>Отель</td>
                 <td class='price11'>Mairy Hotel</td>
                 </tr>
                 <tr>
                 <td>Адрес</td>
                 <td class='price11'>Карачаево-Черкесская Республика,Архыз, поселок Романтик,ул. Горная, 13.
                 </tr>
                 <tr>
                 <td>Тип номера</td>
                 <td class='price11'>{Room}</td>
                 </tr>
                 <tr>  
                <tr>
                 <td>Количество человек:</td>
                 <td class='price11'>{model.CountPeople +model.CountChildren}</td>
                 </tr>
                 <tr>
                 <td>Дата бронирования:   </td>
                 <td class='price11'>{DateTime.Now} </td>
                 </tr>
                 <tr>
                 <td>Дата заезда:</td>
                 <td class='price11'>{model.DateOfArrival} </td>
                 </tr>
                 <tr>
                 <td>Дата выезда:</td>
                 <td class='price11'>{model.DepartureDate} </td>
                 </tr>
                 <tr>
                 <td>Скидка клиента:</td>
                 <td class='price11'>{Discount} %</td>
                 </tr>
                 <tr class='total'>
                 <td>Итоговая стоимость:</td>
                 <td class='price11'>{model.Cost} ₽</td>
                 </tr>
                 <tr class='total'>
                 <td>Предоплата:</td>
                 <td class='price11'>{model.Cost *0.3} ₽</td>
                 </tr>
                 </table>       
                 </div>
                  <div style='text-align:center; font-size:19px'><p>Пожалуйста, предъявите этот документ при размещении!</p></div>
                 <table class='table11'> 
                 <tr class='total'>
                    <td>Менеджер:{ManagerSurname} {NameManager} {ManagerPatronymic}</td>
                </tr>  
                 </table> 
                 </div>
                 </body>
                 </html>");
            return sb.ToString();
        }
    }
}

