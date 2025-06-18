class Currencyapi::Configuration

  ENDPOINT = {
    v3: 'https://api.currencyapi.com/v3'
  }

  mattr_accessor :api_version do
    3
  end

  mattr_accessor :token


  def api_request
    response = HTTParty.get(ENDPOINT, token)
  end

  class << self
  
  def setup(&block)
    yield self if block_given?
    self
  end

  def get_endpoint(api_version = nil)
    api_version ||= Asaas::Configuration.api_version
    ENDPOINT[:"v#{api_version}"]
  end

  def api_request
    response = HTTParty.get(get_endpoint, token)
  end
end