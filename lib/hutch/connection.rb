require 'bunny'

module Hutch
  class Connection
    def start
      connection.start
    end

    def connection
      @connection ||= Bunny.new
    end

    def create_channel
      connection.create_channel
    end
  end
end
