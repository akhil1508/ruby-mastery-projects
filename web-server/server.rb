require 'json'
file = File.open('index.html','r')
response_index = %{
HTTP/1.1 200 OK
Content-type: text/html
Content-length: #{file.size}
Connection: close\r\n\r\n
#{IO.read(file)}
}
response_not_found = %{
  HTTP/1.1 404 Not Found
  Connection: close\r\n\r\n

  <h1>File Not Found<h1>
}
require 'socket'
server = TCPServer.new('localhost', 2345)
loop do
  socket = server.accept
  request = socket.read_nonblock
  if request.match '/index.html'
     socket.puts response_index
  elsif request.match 'json'
    thanks_file = File.open('thanks.html','r').read
    unparsed_json = request.split.select{|i| i.match('{')}.join
    params = JSON.parse(unparsed_json)
    name = params["viking"]["name"]
    email = params["viking"]["email"]
    html_substitution = %{
      <li>#{name}</li>
      <li>#{email}</li>
    }
    thanks_file = thanks_file.gsub('<%= yield %>', html_substitution)
    response = %{
      HTTP/1.1 200 OK
      #{thanks_file}
    }
    socket.puts response
  else
    socket.puts response_not_found
  end
  socket.close
end
