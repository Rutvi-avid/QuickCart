using QuickCart.API.Data.Models;

namespace QuickCart.API.Repository.Interface;
public interface IUserService
{
    public Task<OperationResult> RegisterUser(UserModel model);
    public Task<OperationResult<UserModel>> Login(LoginModel model);
}
