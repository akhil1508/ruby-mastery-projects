require 'json'
require 'socket'
def response_index
  file = File.open('index.html','r')
  response = %{HTTP/1.1 200 OK\nContent-type: text/html\nContent-length: #{file.size}\nConnection: close\r\n\r\n#{IO.read(file)}}
  return response
end
def response_not_found
response = %{HTTP/1.1 404 Not Found\nConnection: close\r\n\r\n<h1>File Not Found<h1>}
response
end

def json_response_creator request
  thanks_file = File.open('thanks.html','r').read
  unparsed_json = request.split.select{|i| i.match('{')}.join
  params = JSON.parse(unparsed_json)
  name = params["viking"]["name"]
  email = params["viking"]["email"]
  html_substitution = %{<li>#{name}</li>\n<li>#{email}</li>}
  thanks_file.gsub!('<%= yield %>', html_substitution)
  response = %{HTTP/1.1 200 OK\r\n\r\n#{thanks_file}}
  response
end

server = TCPServer.new(2345)
loop do
  socket = server.accept
  request = socket.gets("\r\n\r\n")
  if request.match 'index.html'
     socket.puts response_index
  elsif request.match 'json'
    socket.write json_response_creator(request)
  else
    socket.write response_not_found
  end
  socket.close
end
