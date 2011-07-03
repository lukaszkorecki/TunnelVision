require 'yaml'
require 'fileutils'

module TunnelVision
  class Runner
    def initialize args
      if args.empty?
        puts "Command me!"
        puts help
        exit 0
      end

      @tunnel = TunnelVision::Tunnel.new

      case args.first
      when 'generate'
        generate
      when 'start'
        start
      when 'status'
        status
      when 'stop'
        stop
      else
        puts "Unrecognized command"
      end
    end

    def start
      begin
        tunnels = YAML::load_file 'tunnels.yaml'
      rescue
        puts "No tunnels file!"
        exit 1
      end

      tunnels.each do |tunnel_def|
        puts "Starting:\n\t#{tunnel_def['description']}"
        @tunnel.add tunnel_def['tunnel'], tunnel_def['user'], tunnel_def['host']
      end

      File.open('.opened_tunnels','w') do |file|
        YAML::dump(@tunnel.pids, file)
      end
    end

    def status
      y YAML::load_file '.opened_tunnels'
    end

    def stop
      @tunnel.pids = YAML::load_file('.opened_tunnels')
      @tunnel.close_all!
      FileUtils.rm '.opened_tunnels'

    end

    def help
      <<-HELP
        tunnelvision generate - generate example tunnels file
        tunnelvision start - start all ssh tunnels defined in tunnels.yaml
        tunnelvision stop - stop all opened ssh tunnels
      HELP
    end

    def generate
      puts "Generating tunnels.yaml"
      example = [
        {
          'description' => 'irc on staging server',
          "user" => 'bob',
          'host' => 'example.com',
          'tunnel' => '123:123.0.0.1:80'
        },
        {
          'description' => 'db from database server',
          'user' => 'clyde',
          'host' => 'bar.foo.com',
          'tunnel' => '7777:bar.foo.com:8080'
        }
      ]

      begin
        File.open('tunnels.yaml', 'w') do |file|
          YAML::dump(example, file)
        end

      rescue "Error when creating tunnels.yaml"
      end
      puts "Created!"
    end
  end
end
