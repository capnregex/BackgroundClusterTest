 # In one script, start this first
 require 'socket'
 include Socket::Constants
 socket = Socket.new( AF_INET, SOCK_STREAM, 0 )
 sockaddr = Socket.pack_sockaddr_in( 2200, 'localhost' )
 socket.bind( sockaddr )
 socket.listen( 5 )
 client, client_sockaddr = socket.accept
 puts "The client said, '#{client.readline.chomp}'"
 client.puts "Hello from script one!"
 socket.close


