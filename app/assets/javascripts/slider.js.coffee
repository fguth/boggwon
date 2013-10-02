BOGGWON.slider =
  init: () ->
    @left_arrow = $('.raffle-control.left')
    @right_arrow = $('.raffle-control.right')
    @raffle_detail = $('.raffle-detail')
    @raffle_number = $('.raffle-number')

    BOGGWON.slider.update_arrows()
    BOGGWON.slider.move_numbers()
    BOGGWON.slider.bind()

  bind: () ->
    BOGGWON.slider.left_arrow.on 'click', (e) ->
      e.preventDefault()
      BOGGWON.slider.move_to_left(e)
      BOGGWON.slider.move_numbers(true)
      BOGGWON.slider.update_arrows()
      BOGGWON.transactions.update()
    
    BOGGWON.slider.right_arrow.on 'click', (e) ->
      e.preventDefault()
      BOGGWON.slider.move_to_right(e)
      BOGGWON.slider.move_numbers(true)
      BOGGWON.slider.update_arrows()
      BOGGWON.transactions.update()

  move_to_left: (e) ->
    if $('.lefted').length > 0
      BOGGWON.slider.raffle_detail.find('.centered')
        .addClass('righted')
        .removeClass('centered')
        .prev('.lefted')
        .removeClass('lefted')
        .addClass('centered')

  move_to_right: (e) ->
    if $('.righted').length > 0
      BOGGWON.slider.raffle_detail.find('.centered')
        .addClass('lefted')
        .removeClass('centered')
        .next('.righted')
        .removeClass('righted')
        .addClass('centered')

  move_numbers: (animate) ->
    panels = BOGGWON.slider.raffle_detail.find('li')
    index = panels.index($('.centered'))

    if !animate
      BOGGWON.slider.raffle_number.find('ul').css({left: 480 - (index * 120)})
    else
      BOGGWON.slider.raffle_number.find('ul').animate({left: 480 - (index * 120)}, 350)

  update_arrows: () ->
    if $('.lefted').length > 0
      BOGGWON.slider.enable_arrow(BOGGWON.slider.left_arrow)
    else
      BOGGWON.slider.disable_arrow(BOGGWON.slider.left_arrow)

    if $('.righted').length > 0
      BOGGWON.slider.enable_arrow(BOGGWON.slider.right_arrow)
    else
      BOGGWON.slider.disable_arrow(BOGGWON.slider.right_arrow)

  disable_arrow: (arrow) ->
    arrow.addClass('disabled')

  enable_arrow: (arrow) ->
    arrow.removeClass('disabled')
