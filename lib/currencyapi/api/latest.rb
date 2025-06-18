class Currencyapi::Api::Latest < Currencyapi::Api::Base
  def initialize(token, api_version)
    super(token, api_version, '/latest')
  end

   def get_response
    super
  end
end