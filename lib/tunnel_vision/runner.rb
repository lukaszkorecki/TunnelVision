require 'yaml'
module TunnelVision
  class Runner
    def initialize args
      fail "Command me! \n#{help()}" if args.empty?
      y args
    end
  end
end
