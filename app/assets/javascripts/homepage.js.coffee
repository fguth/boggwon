jQuery ->
  $(".amount").focus ->
    $('.bet, h1').addClass('step')

  $('.amount').number( true, 2 );
