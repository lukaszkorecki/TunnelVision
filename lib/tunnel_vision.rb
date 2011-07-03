require 'net/ssh/gateway'
module TunnelVision
  class Tunnel
    attr_accessor :pids

    def initialize
      @pids = []
    end

    def add tunnel, user, server
      from, host, to = tunnel.split(':')
      getaway = Net::SSH::Gateway.new server, user
      port = gateway.open(host, from, to)
      @pids << port
      puts "Spawned #{@pids.last}"

    end

    def close_all!
      @pids.each do |pid|
        puts "Closing #{pid}"
        `kill -9 #{pid}`
      end
    end
  end

end
