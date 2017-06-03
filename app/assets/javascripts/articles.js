var foo = function () {
    var name = $("#comment_name").text();
    alert(name);
    if (name.equals("") || name.length <= 3) {
        console.log("hello world");
        alert("passwd or name is false.");
        return false;
        locate.reload();
    }
};