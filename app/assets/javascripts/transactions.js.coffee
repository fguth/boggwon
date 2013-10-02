BOGGWON.transactions =
  init: () ->
    BOGGWON.transactions.update()

  load: (page, callback) ->
    do get_orders = (page, callback) ->
      $.ajax
        url: BOGGWON.api_url + 'orders?api_key=' + BOGGWON.api_key + '&page=' + page
        type: 'GET'
        dataType: 'jsonp'
        success: (orders) ->
          get_transactions(orders)
        error: ->
          BOGGWON.transactions.render()

    get_transactions = (orders) ->
      i = 0
      while i < orders.total_count
        do (i) ->
          get_transaction(orders.orders[i].order).done (transaction) ->
            orders.orders[i].order.transaction = transaction.transaction
            callback(orders) if i is orders.total_count - 1
        i++

    get_transaction = (order) ->
      $.ajax
        url: BOGGWON.api_url + 'transactions/' + order.transaction.id + '?api_key=' + BOGGWON.api_key,
        type: 'GET'
        dataType: 'jsonp'
        error: ->
          BOGGWON.transactions.render()

  render: (orders) ->
    if orders
      if orders.total_count is 0
        orders.error = 'No bets yet'
    else
      orders.error = 'We got an error'
    $('.transactions').handlebars($('#transactions'), orders)

  update: () ->
    BOGGWON.transactions.load 1, (orders) ->
      BOGGWON.transactions.render(orders)
