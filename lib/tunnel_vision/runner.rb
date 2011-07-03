require 'yaml'
module TunnelVision
  class Runner
    def initialize args
      if args.empty?
        puts "Command me!"
        puts help
        exit 0
      end

      @tunnel = ::Tunnel.new

      case args.first
      when 'generate'
        generate

      when 'start'
        start
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
        @tunnel.add tunnel_def['tunnel'], tunnel_def['user'], tunnel_def['host']
      end
    end

    def stop
      @tunnel.close_all!
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
      example = {
        "example" => {
          "user" => 'bob',
          'host' => 'example.com',
          'tunnel' => '123:123.0.0.1:80'
        },
          'typical' => {
          'user' => 'clyde',
          'host' => 'bar.foo.com',
          'tunnel' => '7777:bar.foo.com:8080'
        }
      }

      begin
        File.open('tunnels.yaml', 'w') do |file|
          file.write example.to_yaml
        end

      rescue "Error when creating tunnels.yaml"
      end
      puts "Created!"
    end
  end
end
