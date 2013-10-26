BOGGWON.list =
  init: () ->
    BOGGWON.orders.findAll().done (result) ->
      i = 0
      len = result.orders.length
      while i < len
        orders = result
        j = i;
        transactionID = orders.orders[i].order.transaction.id
        BOGGWON.transactions.find(transactionID).done (result) ->
          orders.orders[j].order.transaction = result
          BOGGWON.orders.addFloatedDolar(orders.orders[j].order)
          BOGGWON.orders.addFloatedBitcoin(orders.orders[j].order)
          BOGGWON.list.render orders
        i++

  render: (orders) ->
    if orders
      if orders.total_count is 0
        orders.error = 'No bets yet'
    else
      orders.error = 'We got an error'
    $('.list').handlebars($('#list'), orders)