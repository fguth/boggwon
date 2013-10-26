BOGGWON.transactions =
  find: (transactionID) ->
    $.ajax
      url: BOGGWON.api_url + 'transactions/' + transactionID + '?api_key=' + BOGGWON.api_key
      type: 'GET'
      dataType: 'jsonp'