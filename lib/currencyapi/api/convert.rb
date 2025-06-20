class Currencyapi::Api::Convert < Currencyapi::Api::Base
  # DOC - https://currencyapi.com/docs/convert
  def initialize(token, api_version, params)
    super(token, api_version, '/convert', params)
  end

  def get_response
    super
  end
end