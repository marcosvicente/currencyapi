class Currencyapi::Client
  attr_reader :token
  attr_reader :api_version

  def initialize(token: nil, api_version: nil)
    @token = token || Currencyapi::Configuration.token
    @api_version = api_version || Currencyapi::Configuration.api_version
  end

  def convert(params)
    convert_params = Currencyapi::Entity::Convert.new(params)
    response = Currencyapi::Api::Convert.new(@token, @api_version, convert_params)
    convert ||= response.get_response
  end

  def latest
    response ||= Currencyapi::Api::Latest.new(@token, @api_version)
    latest ||= response.get_response
  end
end