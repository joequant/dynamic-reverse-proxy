proxy = require "http-proxy"

routes = {}
   "": 
      host: "localhost"
      port: "80"
   "quickconnect": 
      host: "localhost"
      port: "3000"

server = proxy.createServer (req, res, proxy) ->
   urlParts = req.url.split "/"
   hostKey = urlParts[1]
   host = routes[hostKey] or routes[""]
   
   console.log "Sending #{req.url} to #{host.host}:#{host.port}..."
   proxy.proxyRequest req, res, host

server.listen 8010