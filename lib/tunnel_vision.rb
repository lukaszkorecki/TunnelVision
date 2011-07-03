module TunnelVision
  class Tunnel

    def initialize
      @pids = []
    end

    def add command, user, host
      cmd = 'ssh -L'
      cmd << user
      cmd << '@'
      cmd << host

      cmd << ' '
      cmd << command

      @pids << spawn(cmd)
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
