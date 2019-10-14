alert("I'm active");

jQuery.validator.addMethod("lettersonly", function (value, element) {
    return this.optional(element) || /^[A-Za-z ]+$/i.test(value);
}, "Letters and spaces only please");

$.validator.addMethod('filesize', function (value, element, max) {
    return this.optional(element) || (element.files[0].size <= max);
}, 'Photo size must be less than {0}');

$().ready(val("#registerForm"));

function val(text) {
    $(text).validate({
        rules: {
            firstname: {
                required: true,
                maxlength: 30,
                lettersonly: true
            },
            lastname: {
                required: true,
                maxlength: 30,
                lettersonly: true
            },
            username: {
                required: true,
                maxlength: 30
            },
            email: {
                required: true,
                maxlength: 30,
                email: true
            },
            password: {
                required: true,
                maxlength: 30
            },
            confirmPassword: {
                equalTo:"#password"
            },
            photo: {
                filesize: 104857600
            }
        },
        messages: {
            firstname: {
                required: "Please enter you first name",
                maxlength: "First name must cosist of maximum 30 characters"
            },
            lastname: {
                required: "Please enter your last name",
                maxlength: "Last name must cosist of maximum 30 characters"
            },
            username: {
                required: "Please enter username",
                maxlength: "Username must cosist of maximum 30 characters"
            },
            email: {
                required: "Please enter email",
                maxlength: "Email must cosist of maximum 30 characters",
                email: "This is not a valid email address"
            },
            password: {
                required: "Please enter password",
                maxlength: "Password must cosist of maximum 30 characters"
            },
            confirmPassword: {
                equalTo: "Password not confirmed"
            }
        }
    });
}


