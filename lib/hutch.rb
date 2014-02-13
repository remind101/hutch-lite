require 'hutch/version'
require 'hutch/channel'
require 'hutch/connection'
require 'hutch/configuration'

module Hutch
  class << self
    attr_reader :connection

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end

    def connection
      @connection ||= Connection.new.tap do |connection|
        connection.start
      end
    end

    # Public: Publish a message to the exchange.
    #
    # routing_key - The routing key.
    # message     - A Hash of data to send.
    # properties  - A Hash of options.
    def publish(*args)
      channel.publish(*args)
    end

    def channel
      @channel ||= Channel.new(connection)
    end
  end
end
