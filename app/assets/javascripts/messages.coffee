$ ->
    $("form#new_message").on "submit", (event) ->
        div = $("<div class='alert alert-primary' role='alert'>Send messages succeed<div>")
        $("nav").after(div)
        event.preventDefault()