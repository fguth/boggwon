BOGGWON.homepage =
  init: () ->
    BOGGWON.homepage.bind()
    BOGGWON.slider.init()

  bind: () ->
    $('.amount').on 'click', (e) ->
      BOGGWON.homepage.changeStep()

    $('.trigger').on 'click', (e) ->
      e.preventDefault()
      BOGGWON.homepage.openShareOptions()

  changeStep: () ->
    $('.bet, h1').addClass('step')

  revealGo: () ->
    $('.go').addClass('revealed')

  openShareOptions: () ->
    $('.share').addClass('active')
