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

      def get_response
        @response = HTTParty.get(parse_url, headers: get_headers, params: @params)
        parse_response
      end

      protected
      def parse_url(id = nil)
        u = URI(@endpoint + @route)
        if @param.nil?
          u.path += "/#{param}"
        end
        u.to_s
      end

      def parse_response
        if  @response.code == 200
          res = response_success
        else
          res = errors_response
        end
        res
      end

      def errors_response
        @errors = Array.new
        case @response.code
          when 400
            response_bad_request
          when 401
            response_unauthorized
          when 404
            response_not_found
          when 500
            response_internal_server_error
          else
            response_internal_server_error
        end
      end
      
      def response_success
        response = JSON.parse(@response.body)
        response
      end

      def response_unauthorized
         @errors  << Currencyapi::Entity::ErrorItem.new(code: @response.code, description: 'The api_key is invalid')
        Currencyapi::Entity::Error.new(errors: @errors)
      end

      def response_internal_server_error
          @errors << Currencyapi::Entity::ErrorItem.new(code: @response.code, description: 'Internal Server Error')
        Currencyapi::Entity::Error.new(errors: @errors)
      end

      def response_not_found
         @errors << Currencyapi::Entity::ErrorItem.new(code: @response.code, description: 'Object not found')
        Currencyapi::Entity::Error.new(errors: @errors)
      end

      def response_bad_request
         @errors  << Currencyapi::Entity::ErrorItem.new(code: @response.code, description: 'Bad Request')
        Currencyapi::Entity::Error.new(errors: @errors)
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