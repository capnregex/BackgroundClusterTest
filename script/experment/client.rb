#!/usr/bin/ruby

require 'socket'

class BgClient
  attr_accessor :tcp, :udp, :af, :port, :host, :addr
  def initialize
    @tcp = TCPSocket.new 'localhost', 1024
    @udp = UDPSocket.new
    @af, @port, @host, @addr = tcp.addr
    udp.bind(addr,port)
    STDOUT.reopen tcp
#    STDERR.reopen tcp
    STDIN.reopen tcp
    puts "Hello"
  end
  def run
    Thread.new do
      while m = udp.recvfrom(1024)
	msg, addr = m
	$stderr.puts "udp:#{msg}"
      end
    end
    while cmd = gets
      $stderr.puts cmd
      case cmd.chomp.downcase
      when 'quit'
	exit
      when 'time'
	puts Time.new
      end
    end
  end
end
BgClient.new.run

