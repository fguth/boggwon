BOGGWON.homepage =
  init: () ->
    BOGGWON.homepage.bind()
    BOGGWON.slider.init()

  bind: () ->
    $('.amount').on 'focus', (e) ->
      BOGGWON.homepage.changeStep()

  changeStep: () ->
    $('.bet, h1').addClass('step')
