#!/usr/bin/ruby

require 'etc'
require 'socket'
require 'gserver'

begin
  if Process.uid == 0 and user = Etc.getpwnam('rob')
    Process.uid = user.uid
    Process.euid = user.uid
  end
rescue
end

include Socket::Constants

STDOUT.reopen(File.open("#{__FILE__}.log",'w'))
STDERR.reopen(File.open("#{__FILE__}.err",'w'))

#
# A server that returns the time in seconds since 1970.
#
class TimeServer < GServer
  def serve(io)
    puts io.addr.inspect
    puts io.peeraddr.inspect
    puts @connections.inspect
#    io.methods.sort.each do |m|
#    puts m
#    end
    puts io.gets
    $stdout.flush
    io.puts(Time.now)
  end
end

# Run the server with logging enabled (it's a separate thread).
server = TimeServer.new(1024)
server.audit = true                  # Turn logging on.
server.start

udp = UDPSocket.new
udp.bind('localhost',1024)
puts "udpaddr: #{udp.addr.inspect}"
$stdout.flush
#udp.listen 1
while m = udp.recvfrom(1024)
  msg, addr = m
  puts "udp: #{addr.inspect}"
  case msg.downcase
  when 'quit'
    exit
  else
    puts msg
    $stdout.flush
  end
end

