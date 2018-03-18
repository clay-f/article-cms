document.addEventListener("turbolinks:load", function() {
    {
        $("form#new_comment").keydown((e) => {
            if ((e.keyCode == 10 || e.keyCode == 13) && e.ctrlKey) {
                $.ajax({
                    method: "post",
                    url: "/articles/" + $("#article_id").val() + "/comments",
                    data: $("form#new_comment").serialize(),
                    success: function(data) {
                        alert(data);
                        $("form#new_comment")[0].reset();
                    }
                });
            }
        });
    }
})