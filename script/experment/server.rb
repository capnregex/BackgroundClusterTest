#!/usr/bin/ruby

require 'etc'
require 'socket'
require 'gserver'

include Socket::Constants

#
# A server that returns the time in seconds since 1970.
#
class Worker
  attr_accessor :io, :af, :port, :host, :addr
  def initialize io, af, port, host, addr
    @io, @af, @port, @host, @addr = io, af, port, host, addr
  end
  def key
    "#{addr}:#{port}"
  end
  def run
    while line = io.gets
      puts line
      case line.chomp
      when 'Hello'
	io.puts('time')
      end
      $stdout.flush
    end
  end
end

class BgServer < GServer
  attr_accessor :udp, :workers
  def initialize port=1024, *args
    @workers = {}
    @available = []
    super
    @udp = UDPSocket.new
    @udp.bind(nil,port)
  end

  def start
    super
    while m = udp.recvfrom(1024)
      msg, addr = m
      udp_serve msg, *addr
    end
  end

  def serve(io)
    worker = Worker.new io, *(io.peeraddr)
    workers[worker.key]=worker
    worker.run
  end

  def udp_serve msg, af, port, host, addr
    case msg.downcase
    when 'quit'
      exit
    else
      puts msg
      $stdout.flush
    end
  end
end

uname = ENV['UNAME'] 
port  = ENV['PORT'] || 1024

begin
  if uname = ENV['UNAME'] and Process.uid == 0 and user = Etc.getpwnam(uname)
    Process.uid = user.uid
    Process.euid = user.uid
    STDOUT.reopen(File.open("#{__FILE__}.log",'w'))
    STDERR.reopen(File.open("#{__FILE__}.err",'w'))
  end
rescue
end

# Run the server with logging enabled (it's a separate thread).
server = BgServer.new(port)
server.audit = true                  # Turn logging on.
server.start

throw "Should never get here!"

