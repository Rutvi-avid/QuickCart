using QuickCart.Web.Helper;
using Microsoft.AspNetCore.Mvc;

namespace QuickCart.Web.Controllers;

[SessionValidation]
public class ShoppingCartController : Controller
{
    public IActionResult Index()
    {
        return View();
    }
}
