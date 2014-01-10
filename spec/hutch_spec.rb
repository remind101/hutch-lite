require 'spec_helper'

describe 'Hutch' do
  describe '.publish' do
    it 'publishes a message' do
      Hutch.publish('api.foo.bar', foo: :bar)
    end
  end
end
