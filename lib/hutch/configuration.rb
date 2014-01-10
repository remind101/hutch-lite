module Hutch
  class Configuration
    attr_accessor :exchange_name
    attr_accessor :properties

    def initialize
      @exchange_name = 'hutch'
      @properties = proc { {} }
    end
  end
end
