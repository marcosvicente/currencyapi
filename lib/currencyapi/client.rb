class Currencyapi::Client
  attr_reader :token
  attr_reader :api_version

  def initialize(token: nil, api_version: nil)
    @token = token || Currencyapi::Configuration.token
    @api_version = api_version || Currencyapi::Configuration.api_version
  end

  def convert(param)
    response = Currencyapi::Api::Convert.new(@token, @api_version, param)
    
    convert ||= response.get_response
  end

  def latest
    @latest ||= Currencyapi::Api::Latest.new(@token, @api_version)
  end
end