BOGGWON.buttons =
  findAll: () ->
    buttons = {}
    $.ajax
      url: document.baseURI + 'assets/database.json'
      type: 'GET'
      dataType: 'json'
      async: false
      success: (result) ->
        buttons = result
    buttons

  filterByCustom: (buttons, custom) ->
    button = {}
    i = 0
    len = buttons.buttons.length
    while i < len
      button = buttons.buttons[i] if butotns.buttons[i].custom is custom
      i++
    button

  filterByID: (orders, buttonID) ->
    button = {}
    i = 0
    len = buttons.buttons.length
    while i < len
      button = buttons.buttons[i].order if buttons.buttons[i].id is buttonID
      i++
    button

  render: (buttons) ->
    if buttons
      if buttons.total_count is 0
        buttons.error = 'No raffles yet'
    else
      buttons.error = 'We got an error'
    $('.button-repository').handlebars($('#button'), buttons)