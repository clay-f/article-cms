$(function () {
    function checkArticleForm() {
        (function () {
            $("#article_title").blur(function () {
                var titleLeng = $(this).var().length;
                if (titleLeng < 3) {
                    return false;
                }
            });
        })();
    }

    function checkCommentForm() {
        (function () {
            $("input#comment_name").blur(function () {
                var $parent = $(this).parent();
                $parent.find("div.text-danger").remove();
                if ($(this).val().length < 3) {
                    $parent.append($("<div class='text-danger'>characters less 3</div>"));
                }
            });

            $("textarea#comment_description").blur(function () {
                var $parent = $(this).parent();
                $parent.find("div.text-danger").remove();
                if ($(this).val().length < 3) {
                    $parent.append($("<div class='text-danger'>characters less 3 </div>"));
                }
            });
        })();
    }

    checkCommentForm();


    $("div.comments-form input[type=submit]").click(function () {
        (function () {
            var comment_name_len = $("input#comment_name").val().length;
            var comment_desc_len = $("textarea#comment_description").val().length;

            if (comment_desc_len >= 3 && comment_name_len >= 3) {
                return true
            } else {
                return false;
            }
        })();
    });

});
