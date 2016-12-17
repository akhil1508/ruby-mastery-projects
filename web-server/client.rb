require 'json'
require 'socket'

def request_validate request_type, request_types
  while request_types.include? request_type == false
    unless request_type.include? request_type
        puts 'Enter either POST or GET'
        request_type = gets.chomp
    end
  end
request_type
end

def get_request_creator path
  "GET #{path} HTTP/1.1\r\n\r\n"
end

def file_write_read response
  File.open('sent_file', 'w') { |file| file.write response }
  puts IO.read('sent_file')
end

def viking_data_hash_creator name, email
  viking_data = { :name => name.capitalize, :email => email.downcase }
end

def request_creator hash_json
  "POST HTTP/1.1\r\nContent-type: text/json\nContent-length: #{hash_json.size}\n#{hash_json}\r\n\r\n"
end

socket = TCPSocket.open('localhost', 2345)
request_types = %w(GET POST)
puts 'What kind of a request do you want to send(POST/GET)'
request_type = gets.chomp
request_type = request_validate request_type, request_types

if request_type.casecmp('GET').zero?
    puts 'Enter path'
    path = gets.chomp
    request = get_request_creator path
    socket.puts request
    response = socket.gets('\r\n\r\n')
    puts "Response from server as saved in file \"sent_file\": \n\n"
    file_write_read response
elsif request_type.casecmp('POST').zero?
    hash = {}
    puts 'Enter name of viking'
    name = gets.chomp
    puts 'Enter e-mail of viking'
    email = gets.chomp
    viking_data = viking_data_hash_creator name, email
    hash[:viking] = viking_data
    hash_json = hash.to_json
    request = request_creator hash_json
    socket.write(request)
    response = socket.read
    puts "\n\nResponse from server\n#{response}"
end
