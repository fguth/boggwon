BOGGWON.orders =
  find: (page) ->
    $.ajax
      url: BOGGWON.api_url + 'orders?api_key=' + BOGGWON.api_key + '&page=' + page
      type: 'GET'
      dataType: 'jsonp'

  addFloatedDolar: (order) ->
    return order.total_native.floated = (order.total_native.cents / 100).toFixed(2)

  addFloatedBitcoin: (order) ->
    return order.total_btc.floated = (order.total_btc.cents / 100000000).toFixed(8)