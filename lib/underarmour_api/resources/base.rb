module UnderarmourApi
  # API wrapper
  module Resources
    class Base
      attr_reader :client_id, :token, :response, :endpoint

      def initialize(client, options={})
        @client_id = client.config.client_id
        @token = client.config.access_token || UnderarmourApi::Authorization.new(client).fetch_access_token
        @query = options[:query]
        @params = options[:params]
        after_init(options)
      end

      class << self
      end

      def after_init(args)
        @endpoint = args[:endpoint]
      end

      def request(method)
        response = HTTParty.send(method, url, payload)
        check_response_status(response)
      end

      private

      def url
        "#{base_url}#{endpoint}"
      end

      def base_url
        'https://api.ua.com/v7.1/'
      end

      # def endpoint
      #   raise 'endpoint required by subclasses'
      # end

      def payload
        {
          body: data,
          headers: headers
        }
      end

      def data()
        {}
      end

      def headers
        {
          'content-type' => 'application/x-www-form-urlencoded',
          'api-key' => client_id,
          'accept' => 'application/json',
          'authorization' => "Bearer #{token}",
        }
      end

      def check_response_status(response)
        (200..202).include?(response.code) ? parsed_response(response) : raise_http_error(response)
      end

      def parsed_response(response)
        JSON.parse(response.body)
      end

      def raise_http_error(response)
        Error::HTTPError.raise_error(response)
      end
    end
  end
end
