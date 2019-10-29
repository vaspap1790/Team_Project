//alert("I'm active");

$().ready(val("#logInForm"));

function val(text) {
    $(text).validate({
        rules: {
            username: {
                required: true,
                maxlength: 30
            },
            password: {
                required: true,
                maxlength: 30
            }

        },
        messages: {
            
            username: {
                required: "Please enter username",
                maxlength: "Username must cosist of maximum 30 characters"
            },

            password: {
                required: "Please enter password",
                maxlength: "Password must cosist of maximum 30 characters"
            }
        }
    });
}