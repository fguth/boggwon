BOGGWON.transactions =
  init: () ->
    BOGGWON.transactions.load()

  load: () ->
    $.ajax BOGGWON.api_url + 'orders?api_key=' + BOGGWON.api_key,
      type: 'GET'
      dataType: 'jsonp'
      error: (jqXHR, textStatus, errorThrown) ->
        BOGGWON.transactions.render(errorThrown, false)
      success: (data, textStatus, jqXHR) ->
        BOGGWON.transactions.render(data, true)

  render: (data, success) ->
    if success is true
      if data.total_count is 0
        data.message = 'No bets yet'
    else
      data.message = 'We got an error'

    $('.transactions').handlebars($('#transactions'), data);
