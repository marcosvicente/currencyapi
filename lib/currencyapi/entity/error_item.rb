module Currencyapi
  module Entity
    class ErrorItem  < Dry::Struct
      attribute :code, Currencyapi::Types::Integer
      attribute :description,  Currencyapi::Types::String
    end
  end
end