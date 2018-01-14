App.messages = App.cable.subscriptions.create "MessagesChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    if Number.parseInt(location.href.split('/')[4]) == data.user_id
        $(document.body).append("<h1>hello</h1>")
    console.log data