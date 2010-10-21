#!/usr/bin/ruby

require 'socket'

udp = TCPSocket.new
udp.connect('localhost','1024')
udp.write "from fourth"
udp.close

