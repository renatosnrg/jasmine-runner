var system = require('system');

var page = require('webpage').create()
page.onConsoleMessage = function(msg) {
  console.log(msg);
};

function hasFinished(page) {
  return page.evaluate(function(){
    return jsApiReporter.finished;
  });
};

function waitForFinish(page, onFinish) {
  if (hasFinished(page)) {
    onFinish()
  } else {
    setTimeout(
      function() {waitForFinish(page, onFinish)},
      1000
    );
  }
};

page.open(system.args[1], function(status) {
  if (status == 'success') {
    waitForFinish(page, function() {
      phantom.exit();
    });
  } else {
    console.log('Unable to connect to Jasmine server at ' + system.args[1]);
    phantom.exit();
  }
});