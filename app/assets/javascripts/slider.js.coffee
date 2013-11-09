BOGGWON.slider =
  init: () ->
    @leftArrow = $('.raffle-control.left')
    @rightArrow = $('.raffle-control.right')
    @raffleDetail = $('.raffle-detail')
    @raffleNumber = $('.raffle-number')

    BOGGWON.slider.updateArrows()
    BOGGWON.slider.moveNumbers()
    BOGGWON.slider.bind()

  bind: () ->
    BOGGWON.slider.leftArrow.on 'click', (e) ->
      e.preventDefault()
      BOGGWON.slider.moveToLeft(e)
      BOGGWON.slider.moveNumbers(true)
      BOGGWON.slider.updateArrows()
    
    BOGGWON.slider.rightArrow.on 'click', (e) ->
      e.preventDefault()
      BOGGWON.slider.moveToRight(e)
      BOGGWON.slider.moveNumbers(true)
      BOGGWON.slider.updateArrows()

  render: (orders) ->
    if orders
      if orders.total_count is 0
        orders.error = 'No raffles yet'
    else
      orders.error = 'We got an error'
    $('.raffle-detail').handlebars($('#raffle-detail'), orders)

  moveToLeft: (e) ->
    if $('.lefted').length > 0
      BOGGWON.slider.raffleDetail.find('.centered')
        .addClass('righted')
        .removeClass('centered')
        .prev('.lefted')
        .removeClass('lefted')
        .addClass('centered')

  moveToRight: (e) ->
    if $('.righted').length > 0
      BOGGWON.slider.raffleDetail.find('.centered')
        .addClass('lefted')
        .removeClass('centered')
        .next('.righted')
        .removeClass('righted')
        .addClass('centered')

  moveNumbers: (animate) ->
    panels = BOGGWON.slider.raffleDetail.find('li')
    index = panels.index($('.centered'))

    if !animate
      BOGGWON.slider.raffleNumber.find('ul').css({left: 480 - (index * 120)})
    else
      BOGGWON.slider.raffleNumber.find('ul').animate({left: 480 - (index * 120)}, 350)

  updateArrows: () ->
    if $('.lefted').length > 0
      BOGGWON.slider.enableArrow(BOGGWON.slider.leftArrow)
    else
      BOGGWON.slider.disableArrow(BOGGWON.slider.leftArrow)

    if $('.righted').length > 0
      BOGGWON.slider.enableArrow(BOGGWON.slider.rightArrow)
    else
      BOGGWON.slider.disableArrow(BOGGWON.slider.rightArrow)

  disableArrow: (arrow) ->
    arrow.addClass('disabled')

  enableArrow: (arrow) ->
    arrow.removeClass('disabled')
