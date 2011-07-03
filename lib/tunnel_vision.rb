require 'rubygems'
require 'net/ssh'
module TunnelVision
  class Tunnel
    attr_accessor :pids

    def initialize
      @pids = []
    end

    def add tunnel, user, server
      from, host, to = tunnel.split(':')
      pid = fork do
        getaway = Net::SSH.start server, user do |ssh|
          ssh.forward.local from, host, to
          ssh.loop { true }
        end
      end
      puts pid
      @pids << pid
      pid
    end

    def close_all!
      @pids.each do |pid|
        puts "Closing #{pid}"
        `kill -9 #{pid}`
      end
    end
  end

end
