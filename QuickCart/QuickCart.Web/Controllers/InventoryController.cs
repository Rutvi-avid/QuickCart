using QuickCart.Web.Helper;
using QuickCart.Web.Models;
using Microsoft.AspNetCore.Mvc;

namespace QuickCart.Web.Controllers;

[SessionValidation]
public class InventoryController : Controller
{
    private readonly IApiHelper _apiHelper;
    public InventoryController(IApiHelper apiHelper)
    {
        _apiHelper = apiHelper;
    }

    public IActionResult Index()
    {
        return View();
    }

    [HttpGet]
    public async Task<APIResponseResult<List<ProductModel>>> GetAllProducts()
    {
        var responseMessage = await _apiHelper.MakeApiCallAsync("products", HttpMethod.Get, HttpContext, null);
        var responseAsync = await CommonMethod.HandleApiResponseAsync<List<ProductModel>>(responseMessage);
        return responseAsync;
    }

    [HttpPost]
    public async Task<APIResponseResult<string>> AddProduct([FromBody] ProductModel model)
    {
        model.UserId = HttpContext.Session.GetInt32("UserId");
        var responseMessage = await _apiHelper.MakeApiCallAsync("products", HttpMethod.Post, HttpContext, model);
        var responseAsync = await CommonMethod.HandleApiResponseAsync<string>(responseMessage);
        return responseAsync;
    }

    [HttpPost]
    public async Task<APIResponseResult<string>> EditProductValue([FromBody] ProductModel model)
    {
        model.UserId = HttpContext.Session.GetInt32("UserId");
        var responseMessage = await _apiHelper.MakeApiCallAsync("products/"+ model.Id, HttpMethod.Put, HttpContext, model);
        var responseAsync = await CommonMethod.HandleApiResponseAsync<string>(responseMessage);
        return responseAsync;
    }

    [HttpPost]
    public async Task<APIResponseResult<string>> DeleteProductformList([FromBody] ProductModel model)
    {
        model.UserId = HttpContext.Session.GetInt32("UserId");
        var responseMessage = await _apiHelper.MakeApiCallAsync("products/"+ model.Id + "?userId="+ model.UserId, HttpMethod.Delete, HttpContext, null);
        var responseAsync = await CommonMethod.HandleApiResponseAsync<string>(responseMessage);
        return responseAsync;
    }
}
