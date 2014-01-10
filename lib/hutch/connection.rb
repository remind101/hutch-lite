require 'bunny'

module Hutch
  class Connection
    attr_reader :options

    def initialize(options = {})
      @options = {
        heartbeat: 30,
        automatically_recover: true,
        network_recovery_interval: 1
      }.merge(options)
    end

    def start
      connection.start
    end

    def connection
      @connection ||= Bunny.new(options)
    end

    def create_channel
      connection.create_channel
    end
  end
end
