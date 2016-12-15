require 'json'
require 'socket'
host = 'localhost'
port = 2345
    socket = TCPSocket.open(host, port)
request_types = %w(GET POST)
puts 'What kind of a request do you want to send(POST/GET)'
request_type = gets.chomp
while request_types.include? request_type == false
    unless request_type.include? request_type
        puts 'Enter either POST or GET'
        request_type = gets.chomp
    end
end
if request_type.casecmp('GET').zero?

    puts 'Enter path'
    path = gets.chomp
    request = "GET #{path} HTTP/1.1\r\n\r\n"
    socket.print(request)
    response = socket.read.split("\r\n\r\n")[1]
    File.open('sent_file', 'w') { |file| file.write response } unless response.match('40.')
    puts IO.read('sent_file')
elsif request_type.casecmp('POST').zero?
    hash = {}
    puts 'Enter name of viking'
    name = gets.chomp
    puts 'Enter e-mail of viking'
    email = gets.chomp

    viking_data = { :name => name.capitalize, :email => email.downcase }
    hash[:viking] = viking_data
    hash_json = hash.to_json
    request = "POST HTTP/1.1\r\nContent-type: text/json\nContent-length: #{hash_json.size}\r\n\r\n#{hash_json}"
puts request
  socket.puts(request)


end
