var jsApiReporter;

jasmineRunner = function(reporters) {
  var jasmineEnv = jasmine.getEnv();

  jsApiReporter = new jasmine.JsApiReporter();
  jasmineEnv.addReporter(jsApiReporter);

  if (reporters) {
    for(var i in reporters) {
      jasmineEnv.addReporter(reporters[i])
    }
  } else {
    var htmlReporter = new jasmine.HtmlReporter();
    jasmineEnv.addReporter(htmlReporter);

    jasmineEnv.specFilter = function(spec) {
      return htmlReporter.specFilter(spec);
    };
  }

  var currentWindowOnload = window.onload;

  window.onload = function() {
    if (currentWindowOnload) {
      currentWindowOnload();
    }
    execJasmine();
  };

  function execJasmine() {
    jasmineEnv.execute();
  }

  return jasmineEnv;
}