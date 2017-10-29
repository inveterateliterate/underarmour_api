module UnderArmourApi
  # API wrapper
  class Base
    attr_reader :client_id, :authorization, :endpoint, :data

    def initialize(client, options={})
      @client_id = client.config.client_id
      @endpoint = options[:endpoint]
      @data = options[:data]
      # @token = options[:token] || Authorization.new(authorization_type).access_token
      # after_init
    end

    def request(method)
      HTTParty.send(method, url, payload)
    end

    def authorize
      response = request(:post)
      access_token = response.parsed_response['access_token']
      access_token
    end

    #  can combine get and post with send(:request_method)
    # def get
    #   HTTParty.get(url, payload)
    # end

    # def post
    #   HTTParty.post(url, payload)
    # end

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

    # def data
    #   {}
    # end

    def headers
      {
        'content-type' => 'application/x-www-form-urlencoded',
        'api-key' => @client_id,
        'accept' => 'application/json',
        'user-agent' => "UnderArmourApi/#{UnderArmourApi::VERSION}"
      }
      # bearer token
    end

    # def after_init(args)
      # hook for subclasses
    # end
  end
end
