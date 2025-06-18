# frozen_string_literal: true

require_relative "currencyapi/version"

module Currencyapi
  class Error < StandardError; end
    attr_accessor :api_key
    def currencies
    end

    def latest
    end

    def historical
    end

    def range
    end

    def convert
    end
end
