#!/usr/bin/ruby
require 'slugfactory'
require 'webrick'
include WEBrick

gproc = lambda do |req, resp|
   content = SlugFactory.parse(req.path.sub('/', '').split('/'))
   resp['Content-Type'] = "text/html"
   resp.body = %{<html><body><p>#{content}</p></body></html>}
end

pproc = lambda do |req, resp|
   #message = req.body
   
   
   bits = req.body.split("&")
   
   p = Hash.new
   
   bits.each do |x| 
      tmp = x.split("=")
      key = tmp[0]
      val = tmp[1] 
      p[key] = val
   end
   require 'services/text'
   message = TextService.save(p)
   
   resp['Content-Type'] = "text/html"
   resp.body = %{<html><body><p>#{message}</p></body></html>}
end

gh = HTTPServlet::ProcHandler.new(gproc)
ph = HTTPServlet::ProcHandler.new(pproc)

s = HTTPServer.new(:Port => 2000)
s.mount('/',  gh)
s.mount('/save',  ph)

trap("INT") { s.shutdown }

s.start