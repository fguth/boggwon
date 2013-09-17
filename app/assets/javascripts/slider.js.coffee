BOGGWON.slider =
  init: () ->
    @leftArrow = $('.raffle-control.left')
    @rightArrow = $('.raffle-control.right')
    @raffleList = $('.raffle-detail')

    BOGGWON.slider.bind()

  bind: () ->
    BOGGWON.slider.leftArrow.on 'click', (e) ->
      BOGGWON.slider.moveSliderToLeft(e)
      BOGGWON.slider.updateArrows()
    
    BOGGWON.slider.rightArrow.on 'click', (e) ->
      BOGGWON.slider.moveSliderToRight(e)
      BOGGWON.slider.updateArrows()

  moveSliderToLeft: (e) ->
    e.preventDefault()

    if $('.lefted').length > 0
      BOGGWON.slider.raffleList.find('.centered')
        .addClass('righted')
        .removeClass('centered')
        .prev('.lefted')
        .removeClass('lefted')
        .addClass('centered')

  moveSliderToRight: (e) ->
    e.preventDefault()

    if $('.righted').length > 0
      BOGGWON.slider.raffleList.find('.centered')
        .addClass('lefted')
        .removeClass('centered')
        .next('.righted')
        .removeClass('righted')
        .addClass('centered')

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
