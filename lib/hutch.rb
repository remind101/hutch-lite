require 'hutch/version'

module Hutch

  autoload :Channel, 'hutch/channel'
  autoload :Connection, 'hutch/connection'
  autoload :Configuration, 'hutch/configuration'

  class << self
    attr_reader :connection

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end

    def connect
      @connection = Connection.new.tap do |connection|
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
      channels[Thread.current.object_id] ||= Channel.new(connection)
    end

    def channels
      @channels ||= {}
    end
  end
end
