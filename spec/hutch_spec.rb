require 'spec_helper'

describe Hutch do
  describe '.publish' do
    it 'publishes a message' do
      expect {
        Hutch.publish('api.foo.bar', foo: :bar)
      }.to_not raise_error
    end
  end
end
