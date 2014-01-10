require 'spec_helper'

describe Hutch do
  describe '.publish' do
    it 'publishes a message' do
      expect {
        Hutch.publish('api.foo.bar', foo: :bar)
      }.to_not raise_error
    end
  end

  describe '.channel' do
    it 'is threadsafe' do
      channel = Hutch.channel
      expect(channel).to eq Hutch.channel

      Thread.new {
        expect(Hutch.channel).to_not eq channel
      }.join
    end
  end
end
