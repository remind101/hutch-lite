require 'spec_helper'

describe Hutch::Connection do
  let(:connection) { described_class.new }

  describe '.connection' do
    it 'initializes a new Bunny client' do
      Bunny.should_receive(:new).with(heartbeat: 30, automatically_recover: true, network_recovery_interval: 1)
      connection.connection
    end
  end

  describe '.start' do
    it 'starts the connection' do
      Bunny::Session.any_instance.should_receive(:start)
      connection.start
    end
  end
end
