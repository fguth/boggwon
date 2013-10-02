BOGGWON.transactions =
  init: () ->
    BOGGWON.transactions.load()

  load: () ->
    $.ajax BOGGWON.api_url + 'orders?api_key=' + BOGGWON.api_key,
      type: 'GET'
      dataType: 'jsonp'
      error: (jqxhr, text_status, error_thrown) ->
        BOGGWON.transactions.render(error_thrown, false)
      success: (data, text_status, jqxhr) ->
        BOGGWON.transactions.get_transaction_info(data)

  get_transaction_info: (data) ->
    orders = data
    i = 0
    while i < data.total_count
      do (i) ->
        $.ajax BOGGWON.api_url + "transactions/" + orders.orders[i].order.transaction.id + "?api_key=" + BOGGWON.api_key,
          type: "GET"
          dataType: "jsonp"
          error: (jqxhr, text_status, error_thrown) ->
            BOGGWON.transactions.render error_thrown, false
          success: (data, text_status, jqxhr) ->
            orders.orders[i].order.transaction = data.transaction
            BOGGWON.transactions.render(orders, true) if i is orders.total_count - 1
      i++

  render: (data, success) ->
    if success is true
      if data.total_count is 0
        data.message = 'No bets yet'
    else
      data.message = 'We got an error'
    $('.transactions').handlebars($('#transactions'), data)
