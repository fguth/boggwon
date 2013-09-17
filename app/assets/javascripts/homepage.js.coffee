BOGGWON.homepage =
  init: () ->
    BOGGWON.homepage.bind()
    BOGGWON.slider.init()

  bind: () ->
    $('.amount').on 'focus', (e) ->
      BOGGWON.homepage.changeStep()

    $('.amount').on 'keyup', (e) ->
      BOGGWON.homepage.revealGo()

  changeStep: () ->
    $('.bet, h1').addClass('step')

  revealGo: () ->
    $('.go').addClass('revealed')