using QuickCart.API.Data.Models;
using QuickCart.API.DTO.Interface;
using QuickCart.API.Repository.Interface;

namespace QuickCart.API.DTO.Service;

public class UserDto : IUserDto
{
    private readonly IUserService _user;
 
    public UserDto(IUserService userService)
    {
        this._user = userService;
    }

    public Task<OperationResult<UserModel>> Login(LoginModel model)
    {
        return _user.Login(model);
    }

    public Task<OperationResult> RegisterUser(UserModel model)
    {
        return _user.RegisterUser(model);
    }
}
