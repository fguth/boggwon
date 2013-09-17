BOGGWON.homepage =
  init: () ->
    BOGGWON.homepage.bind()

  bind: () ->
    $('.amount').on 'focus', (e) ->
      BOGGWON.homepage.changeStep()

    $('.raffle-control').on 'click', (e) ->
      BOGGWON.homepage.moveSlider(e, $(this))

  changeStep: () ->
    $('.bet, h1').addClass('step')

  moveSlider: (e, arrow) ->
    e.preventDefault()

    if arrow.hasClass('right') and $('.righted').length > 0
      $('.centered')
        .addClass('lefted')
        .removeClass('centered')
        .next('.righted')
        .removeClass('righted')
        .addClass('centered')

    if arrow.hasClass('left') and $('.lefted').length > 0
      $('.centered')
        .addClass('righted')
        .removeClass('centered')
        .prev('.lefted')
        .removeClass('lefted')
        .addClass('centered')