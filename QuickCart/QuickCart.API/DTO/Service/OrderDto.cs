﻿using QuickCart.API.Data.Models;
using QuickCart.API.DTO.Interface;
using QuickCart.API.Repository.Interface;

namespace QuickCart.API.DTO.Service;
public class OrderDto : IOrderDto
{
    private readonly IOrderService _order;
    public OrderDto(IOrderService order) => _order = order;

    public Task<OperationResult> CreateOrder(OrderModel model) => _order.CreateOrder(model);

    public Task<OperationResult<List<OrderItemModel>>> GetOrderDetail(int id) => _order.GetOrderDetail(id);

    public Task<OperationResult<List<OrderModel>>> GetOrders(int userId) => _order.GetOrders(userId);
}
