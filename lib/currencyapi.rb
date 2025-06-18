# frozen_string_literal: true
require 'httparty'
require 'active_support'
require 'active_support/inflector'
require 'dry-struct'

require_relative "currencyapi/version"

module Currencyapi
  autoload :Configuration, 'currencyapi/configuration'
  autoload :Client, 'currencyapi/client'
  autoload :Api, 'currencyapi/api'
  autoload :Entity, 'currencyapi/entity'
  autoload :Types, 'currencyapi/types'

  include Dry.Types()

  class << self
    def setup(&block)
      Currencyapi::Configuration.setup(&block)
    end
  end
end
