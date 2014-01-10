require 'json'
require 'securerandom'

module Hutch
  class Channel
    attr_reader :connection
    attr_reader :channel

    def initialize(connection)
      @connection = connection
      @channel = connection.create_channel
    end

    def exchange
      @exchange ||= channel.topic(config.exchange_name, durable: true)
    end

    def publish(routing_key, message, properties = {})
      payload = JSON.dump(message)

      properties = {
        message_id: SecureRandom.uuid,
        persistent: true,
        routing_key: routing_key,
        timestamp: Time.now.to_i,
        content_type: 'application/json'
      }.merge(properties).merge(config.properties.call)

      exchange.publish(payload, properties)
    end

    private

    def config
      Hutch.configuration
    end
  end
end
