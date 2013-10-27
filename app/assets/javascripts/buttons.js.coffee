BOGGWON.buttons =
  findAll: () ->
    $.ajax
      url: document.baseURI + 'assets/database.json'
      type: 'GET'
      dataType: 'json'

  findByCustom: (buttons, custom) ->
    button = {}
    i = 0
    len = buttons.buttons.length
    while i < len
      button = buttons.buttons[i] if butotns.buttons[i].custom is custom
      i++
    button

  findByID: (orders, buttonID) ->
    button = {}
    i = 0
    len = buttons.buttons.length
    while i < len
      button = buttons.buttons[i].order if buttons.buttons[i].id is buttonID
      i++
    button