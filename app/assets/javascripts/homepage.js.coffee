BOGGWON.homepage =
  init: () ->
    BOGGWON.homepage.bind()
    BOGGWON.slider.init()
    BOGGWON.transactions.init()

  bind: () ->
    $('.amount').on 'click', (e) ->
      BOGGWON.homepage.change_step()

    $('.trigger').on 'click', (e) ->
      e.preventDefault()
      BOGGWON.homepage.open_share_options()

  change_step: () ->
    $('.bet, h1').addClass('step')

  reveal_go: () ->
    $('.go').addClass('revealed')

  open_share_options: () ->
    $('.share').addClass('active')
