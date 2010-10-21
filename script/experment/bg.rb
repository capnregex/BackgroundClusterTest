#!/usr/bin/ruby

require 'etc'
require 'socket'

begin
  if Process.uid == 0 and user = Etc.getpwnam('rob')
    Process.uid = user.uid
    Process.euid = user.uid
  end
rescue
end

include Socket::Constants

#STDOUT.reopen(File.open("#{__FILE__}#{Process.pid}.log",'w'))
#STDERR.reopen(File.open("#{__FILE__}#{Process.pid}.err",'w'))
tcp = TCPSocket.net
tcp.listen(1)
udp = UDPSocket.new
udp.bind('localhost',2200)
puts udp.addr.inspect

