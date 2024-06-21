$(document).ready(function () {

    // Login form validation
    $('#loginForm').submit(function (event) {
        event.preventDefault();

        var username = $('#loginUsername').val().trim();
        var password = $('#loginPassword').val();

        if (username.length > 255) {
            //toastr.error("Invalid Username", "Error");

            alert("Error: Invalid Username")


            return;
        }

        if (password.length < 6) {
            //toastr.error("Password must be at least 6 characters long", "Error");
            alert("Error:Password must be at least 6 characters long")

            return;
        }
        ExistingUserLogin();
    });

    // Sign up form validation
    $('#signupForm').submit(function (event) {
        event.preventDefault();

        var username = $('#signupUsername').val().trim();
        var email = $('#signupEmail').val().trim();
        var password = $('#signupPassword').val();
        var confirmPassword = $('#signupConfirmPassword').val();

        if (username.length > 255) {
            //toastr.error("Username length cannot exceed 255 characters.", "Error");
            alert("Error:Username length cannot exceed 255 characters.")
            return;
        }

        if (email.length > 255) {
           // toastr.error("Email length cannot exceed 255 characters.", "Error");
            alert("Error:Email length cannot exceed 255 characters.")
            return;
        }

        if (password.length < 6) {
           // toastr.error("Password must be at least 6 characters long.", "Error");
            alert("Error:Password must be at least 6 characters long.")
            return;
        }

        if (password !== confirmPassword) {
            //toastr.error("Password and Confirm Password must match.", "Error");
            alert("Error:Password and Confirm Password must match.")
            return;
        }
        UserSignup();
    });

});
function toggleForm() {
    var loginCard = document.getElementById('loginCard');
    var signupCard = document.getElementById('signupCard');

    loginCard.classList.toggle('hidden');
    signupCard.classList.toggle('hidden');
    clearForm();
}

function ExistingUserLogin() {
    var data = {
        Username: $("#loginUsername").val().trim(),
        Password: $("#loginPassword").val()
    }
	$(".loader").show();
    $.ajax({
        type: "POST",
        url: "/User/LoginUser",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: JSON.stringify(data),
        success: function (result) {
			$(".loader").hide();
            localStorage.removeItem('cart');
            if (result.isSuccess) {
                //toastr.success(result.message, "Success");
                alert(result.message)
                window.location.href = "/Inventory";
            } else {
                //toastr.error(result.message, "Error");
                alert(result.message)
            }
        },
        error: function (result) {
			$(".loader").hide();
        }
    });
}
function UserSignup() {
    var data = {
        Username: $('#signupUsername').val().trim(),
        Email: $('#signupEmail').val().trim(),
        Password: $('#signupPassword').val()
    }
	$(".loader").show();
    $.ajax({
        type: "POST",
        url: "/User/SignUpUser",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        data: JSON.stringify(data),
        success: function (result) {
			$(".loader").hide();
            if (result.isSuccess) {
                // toastr.success(result.message, "Success");
                alert(result.message)
				clearForm();
                toggleForm();
            } else {
                //toastr.error(result.message, "Error");
                alert(result.message)
            }

        },
        error: function (result) {
			$(".loader").hide();
        }
    });
}
function clearForm() {
    $("#loginPassword").val("");
    $("#loginUsername").val("");
    $('#signupUsername').val("");
    $('#signupEmail').val("");
    $('#signupPassword').val("");
    $('#signupConfirmPassword').val("");
}