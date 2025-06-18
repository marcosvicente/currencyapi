class Currencyapi::Api::Currencies
  def initialize(token, api_version)
    super(token, api_version, '/currencies')
  end
end