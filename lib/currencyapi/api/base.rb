module Currencyapi
  module Api
    class Base 
      def initialize(client_token, api_version, route = nil, param = nil)
        @token    = client_token
        @route    = route
        @api_version = api_version || Currencyapi::Configuration.api_version
        @endpoint = Currencyapi::Configuration.get_endpoint(api_version)
        @param    = param
      end

      def extract_meta(meta)
        @meta = Currencyapi::Entity::Meta.new(meta)
      end

      def get(params)
        response = HTTParty.get(parse_url, headers: get_headers, params: params)
        parse_response(response)
      end

      protected
      def parse_url(id = nil)
        u = URI(@endpoint + @route)
        if param
          u.path += "/#{param}"
        end
        u.to_s
      end

      def parse_response
        res =  @response.response_code
        case @response.response_code
          when 200
            res = response_success
          when 400
            res = response_bad_request
          when 401
            res = response_unauthorized
          when 404
            res = response_not_found
          when 500
            res = response_internal_server_error
          else
            res = response_not_found
        end
        res
      end

      def convert_data_to_entity(type)
        if @api_version == 2
          "Currencyapi::Entity::#{type.capitalize}".constantize
        else
          "Currencyapi::#{type.capitalize}".constantize
        end
      rescue
        Currencyapi::Entity::Base
      end

      def response_success
        entity = nil
        hash = JSON.parse(@response.body)
        if hash.fetch("object", false) === "list"
          entity = Currencyapi::Entity::Meta.new(hash)
        else
          entity = convert_data_to_entity(hash.fetch("object", false))
          entity = entity.new(hash) if entity
        end

        entity
      end

      def response_unauthorized
        error = Currencyapi::Entity::Error.new
        error.errors << Currencyapi::Entity::ErrorItem.new(code: 'invalid_token', description: 'The api_key is invalid')
        error
      end

      def response_internal_server_error
        error = Currencyapi::Entity::Error.new
        error.errors << Currencyapi::Entity::ErrorItem.new(code: 'internal_server_error', description: 'Internal Server Error')
        error
      end

      def response_not_found
        error = Currencyapi::Entity::Error.new
        error.errors << Currencyapi::Entity::ErrorItem.new(code: 'not_found', description: 'Object not found')
        error
      end

      def response_bad_request
        error = Currencyapi::Entity::Error.new
        begin
          hash = JSON.parse(@response.body)
          errors = hash.fetch("errors", [])
          errors.each do |item|
            error.errors << Currencyapi::Entity::ErrorItem.new(item)
          end
          error
        rescue
          error = Currencyapi::Entity::Error.new
          error.errors << Currencyapi::Entity::ErrorItem.new(code: 'bad_request', description: 'Bad Request')
          error
        end
        error
      end

      def get_headers
        { 'access_token': @token || Currencyapi::Configuration.token }
      end

      def body_parser(body)
        return nil unless body

        body.to_h.delete_if { |k, v| v.nil? || v.to_s.empty? }.to_json
      end

      def request_headers
        {
          'apikey': @token || Currencyapi::Configuration.token,
          'Content-Type': 'application/json'
        }
      end
    end
  end
end