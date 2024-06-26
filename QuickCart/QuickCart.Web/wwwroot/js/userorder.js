﻿$(document).ready(function () {

    var cart = JSON.parse(localStorage.getItem('cart')) || [];
    $("#cartItemCount").text(cart.length);
    var table = $('#orderTable').DataTable({
        "bPaginate": true,
        "bLengthChange": false,
        "bFilter": false,
        "bInfo": false,
        columns: [
            {
                data: 'id'
            },
            {
                data: 'totalPrice', render: function (data) {
                    return '$' + parseFloat(data).toFixed(2);
                }
            },
            { data: 'status' },
            {
                data: null, sorting:false,className:"td-actions", render: function (data, type, row) {
                    var button = '<button class="btn btn-info btn-just-icon btn-sm view-order"><i class="material-icons">visibility</i></button>';
                    return button;
                }
            }
        ]
    });
    var orderItemTable = $('#orderItemsTable').DataTable({
        "bPaginate": false,
        "bLengthChange": false,
        "bFilter": false,
        "bInfo": false,
        columns: [
            {
                data: null, render: function (data) {
                    return data.product.name;
                }
            },
            { data: 'quantity' },
            { data: 'price' },
            {
                data: null, render: function (data) {
                    var total = data.price * data.quantity;
                    return '$' + total.toFixed(2);
                }
            }
        ]
    });

    function fetchData() {
        $.ajax({
            url: 'Order/GetAllOrders',
            method: 'GET',
            success: function (data) {
                table.clear().rows.add(data.data).draw();
                updateViewOrderButtons();
            },
            error: function (xhr, res, status) {
                if (xhr.status == 401) {
                    window.location.href = xhr.responseJSON.redirectUrl;
                    return;
                }
            }
        });
    }

    window.updateViewOrderButtons = function () {
        $('.view-order').off('click').on('click', function () {
            var row = $(this).closest('tr');
            var data = table.row(row).data();
            $("#orderId").text(data.id);
            
            $("#orderDate").text(DateFormatter_MMDDYYYY(data.createdAt));
            var order = {
                Id: data.id
            }

            $.ajax({
                url: '/Order/GetparticularOrderDetails', // Replace with your API URL
                method: 'POST',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                data: JSON.stringify(order),
                success: function (data) {
                    if (data.isSuccess) {

                        orderItemTable.clear().rows.add(data.data).draw();
                        $('#orderDetailsModal').modal('show');
                        updateTotal();
                    } else {
                        //toastr.error(data.message, "Error");
                        alert(data.message)
                    }
                },
                error: function (xhr, res, status) {
                if (xhr.status == 401) {
                    window.location.href = xhr.responseJSON.redirectUrl;
                    return;
                    }
                    // toastr.error(xhr.message, "Error");
                    alert(xhr.message)
            }
            });
        });
    }
    window.updateTotal = function () {
        var total = 0;
        $('#orderItemsTable').DataTable().rows().every(function (rowIdx, tableLoop, rowLoop) {
            var data = this.data();
            total += data.price * data.quantity; // Ensure field names match your data
        });
        $('#grandTotal').text(total.toLocaleString('en-US', { style: 'currency', currency: 'USD' }));
    }
    fetchData();

    window.DateFormatter_MMDDYYYY = function (value) {
        if (value) {
            var formattedDate = moment(value).format('DD/MM/YYYY  HH:mm');
            return formattedDate;
        }
        else {
            return "-";
        }
    }

});