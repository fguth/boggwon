BOGGWON.orders =
  findAll: (page) ->
    $.ajax
      url: BOGGWON.api_url + 'orders?api_key=' + BOGGWON.api_key + '&page=' + page
      type: 'GET'
      dataType: 'jsonp',
      success: (result) ->
        window.current_page = result.current_page
        window.total_count = result.total_count
        window.num_pages = result.num_pages

  findByName: (orders, name) ->
    order = []
    i = 0
    len = orders.orders.length
    while i < len
      order.push(orders.orders[i].order) if orders.orders[i].order.custom is name
      i++
    order

  nextPage: () ->
    BOGGWON.orders.findAll(window.current_page + 1)

  addFloatedDolar: (order) ->
    return order.total_native.floated = (order.total_native.cents / 100).toFixed(2)

  addFloatedBitcoin: (order) ->
    return order.total_btc.floated = (order.total_btc.cents / 100000000).toFixed(8)