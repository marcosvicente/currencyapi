class Currencyapi::Api::Convert
  def initialize(token, api_version)
    super(token, api_version, '/convert')
  end
end