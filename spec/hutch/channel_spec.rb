require 'spec_helper'

describe Hutch::Channel do
  let(:exchange  ) { double Bunny::Exchange }
  let(:chan      ) { double Bunny::Channel, topic: exchange }
  let(:connection) { double Hutch::Connection, create_channel: chan }
  let(:channel   ) { described_class.new(connection) }

  describe '.exchange' do
    it 'declares the correct exchange' do
      chan.should_receive(:topic).with('hutch', durable: true)
      channel.exchange
    end
  end

  describe '.publish' do
    it 'publishes a message' do
      exchange.should_receive(:publish).with(
        JSON.dump(body: 'foo'),
        hash_including(persistent: true, routing_key: 'api.foo.bar', content_type: 'application/json')
      )
      channel.publish('api.foo.bar', body: 'foo')
    end
  end
end
