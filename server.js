var http = require("http"),
    server = http.createServer(),
    dynamicProxy = require("../dynamic-reverse-proxy")();

server.on("request", function (req, res) {
  if (req.url.match(/^\/register/i)) {
    dynamicProxy.registerRouteRequest(req, res);
  }
  else {
    dynamicProxy.proxyRequest(req, res);
  }
});

server.listen(3000, function () {
  console.log("Reverse Proxy started, listening on port 3000");
});
