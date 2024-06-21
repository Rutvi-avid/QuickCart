using QuickCart.API.Data.Models;

namespace QuickCart.API.DTO.Interface;

public interface IUserDto
{
    public Task<OperationResult> RegisterUser(UserModel model);
    public Task<OperationResult<UserModel>> Login(LoginModel model);
}
