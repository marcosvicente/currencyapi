class Currencyapi::Api::Convert < Currencyapi::Api::Base
  # DOC - https://currencyapi.com/docs/convert
  def initialize(token, api_version, param)
    super(token, api_version, '/convert', param)
  end

  def get_response
    super
  end
end