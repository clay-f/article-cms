$(function () {
    $("pre").addClass("prettyprint")
    $("form#new_comment").validate({
        rules: {
            "comment[name]": {
                required: true,
                minlength: 3
            },
            "comment[description]": {
                required: true,
                minlength: 5
            }
        }
    });

    $("form#new_article").validate({
        rules: {
            "article[title]": {
                required: true,
                minlength: 3
            },
            "article[body]": {
                required: true,
                minlength: 5
            }
        }
    });

    $("form.simple_form.edit_article").validate({
        rules: {
            "article[title]": {
                required: true,
                minlength: 3
            },
            "article[body]": {
                required: true,
                minlength: 5
            }
        }
    });

});
