BOGGWON = {
  api_key: 'c467b62acf37548ed3f06861729f00803e924a7d3f55481c365ae7d4d0faccab',
  api_url: 'https://coinbase.com/api/v1/'
};

UTIL = {
  exec: function(controller, action) {
    var ns = BOGGWON,
        action = (action === undefined) ? 'init' : action;

    if (controller !== '' && ns[controller] && typeof ns[controller][action] == 'function') {
      ns[controller][action]();
    }
  },

  init: function() {
    var body = document.body,
        controller = body.getAttribute('data-controller'),
        action = body.getAttribute('data-action');

    UTIL.exec('common');
    UTIL.exec(controller);
    UTIL.exec(controller, action);
  }
};

$(document).ready(UTIL.init);
