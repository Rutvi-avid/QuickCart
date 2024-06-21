using QuickCart.API.Data.Entity;
using Microsoft.EntityFrameworkCore;
using QuickCart.API.Data.Entity.DbSet;

namespace QuickCart.API.Data.Entity;
public class QuickCartDbContext: DbContext
{
    public QuickCartDbContext(DbContextOptions<QuickCartDbContext> options)
          : base(options)
    {
    }
    public DbSet<User> Users { get; set; }
    public DbSet<Product> Products { get; set; }
    public DbSet<Order> Orders { get; set; }
    public DbSet<OrderItem> OrderItems { get; set; }
}

