module Currencyapi
  module Entity
    class Error < Dry::Struct
      attribute :errors, Currencyapi::Types::Array(ErrorItem)
    end
  end
end