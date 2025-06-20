module Currencyapi
  module Entity
    class Convert  < Dry::Struct
      attribute :value, Currencyapi::Types::Integer
      attribute :currencies,  Currencyapi::Types::String.optional
      attribute :base_currency,  Currencyapi::Types::String.optional
      attribute :date,  Currencyapi::Types::Date.optional
      attribute :type,  Currencyapi::Types::String.enum('fiat', 'metal', 'crypto').optional
    end
  end
end
