$().ready(val("#adminRegisterForm"));

function val(text) {
    $(text).validate({
        rules: {
            adminName: {
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
            }

        },
        messages: {

            adminName: {
                required: "Please enter adminName",
                maxlength: "AdminName must cosist of maximum 30 characters"
            },
            email: {
                required: "Please enter email",
                maxlength: "Email must cosist of maximum 30 characters",
                email: "This is not a valid email address"
            },
            password: {
                required: "Please enter password",
                maxlength: "Password must cosist of maximum 30 characters"
            }
        }
    });

}