module TunnelVision
  class Tunnel
    attr_accessor :pids

    def initialize
      @pids = []
    end

    def add tunnel, user, host
      cmd = 'ssh -L '

      cmd << tunnel

      cmd << ' '

      cmd << user
      cmd << '@'
      cmd << host

      puts cmd
      @pids <<  `#{cmd} &`
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
