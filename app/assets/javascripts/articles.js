document.addEventListener("turbolinks:load", function() {
    {
        $("form#new_comment").keydown((e) => {
            if ((e.keyCode == 10 || e.keyCode == 13) && e.ctrlKey) {
                $.ajax({
                    method: "post",
                    url: "/articles/" + $("#article_id").val() + "/comments",
                    data: $("form#new_comment").serialize(),
                    success: function(data) {
                        $("form#new_comment")[0].reset();
                    }
                });
            }
        });

        $("div.like-article").on("click", () => {
            var article_id = window.location.href.split('/')[4].replace(/\?page=+\d/, "");
            $.ajax({
                method: "post",
                url: "/like_articles",
                dataType: "json",
                data: { like_article: { article_id: article_id } },
                success: (data) => {
                    if (data.operate_state == 0) {
                        window.location.replace("http://localhost:3000/users/sign_in");
                    } else {
                        changeLikeArticleState(data.article_state);
                    }
                }
            });
        });
    }

    {
        $("div#comment-list div.comment-list-item a").on("click", (event) => {
            var subCommentForm = $("div#subcomment-form");
            with($(event.target).parent().parent()) {
                var parentCommentId = (attr("class").split(' ')[1].split('-')[1]);
                var parentInput = $("<input type='hidden' name='parent_id' value='" + parentCommentId + "'>");
                subCommentForm.children().append(parentInput);
                append(subCommentForm.css("display", "block"));
            }

        });
    }
})

function changeLikeArticleState(state) {
    var likeArticleSize = $("#like-article-size").text();
    (state == 0) ? --likeArticleSize: ++likeArticleSize;
    $("#like-article-size").text(likeArticleSize);
    switch (state) {
        case 0:
            $("#like_article_state").children().replaceWith("<i class='far fa-heart' id='like_article_state'></i>");
            break;
        case 1:
            $("#like_article_state").children().replaceWith("<i class='fas fa-heart' id='like_article_state'></i>");
            break;
    }
}