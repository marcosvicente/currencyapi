module Currencyapi
  module Configuration
    ENDPOINT = {
      v3: 'https://api.currencyapi.com/v3'
    }

    mattr_accessor :api_version do
      3
    end

    mattr_accessor :token
    mattr_accessor :params

    class << self
      def setup(&block)
        yield self if block_given?
        self
      end

      def get_endpoint(api_version = nil)
        api_version ||= Currencyapi::Configuration.api_version
        ENDPOINT[:"v#{api_version}"]
      end
    end
  end
end