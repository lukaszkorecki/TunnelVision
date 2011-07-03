module TunnelVision
  class Tunnel

    def initialize
      fail "This class doesn't need to be initialized"
    end

    @@pids = []

    def self.add_tunnel command, user, host
      cmd = 'ssh -L'
      cmd << user
      cmd << '@'
      cmd << host

      cmd << ' '
      cmd << command

      @@pids << spawn(cmd)
    end
  end
end
