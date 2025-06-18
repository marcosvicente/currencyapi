class Currencyapi::Client
  attr_reader :token

  def initialize(token = nil, api_version = nil)
    @token = token || Currencyapi::Configuration.token
    @api_version = api_version || Currencyapi::Configuration.api_version
  end

  def convert
    @convert ||= Currencyapi::Api::Convert.new(@token, @api_version)
  end
end