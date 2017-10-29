module UnderArmourApi
  class Authorization
    attr_reader :code, :access_token, :user_id

    def authorize
      response = post
      user_id = response.parsed_response['user_id']
      access_token = response.parsed_response['access_token']
      access_token
    end

    private

    def endpoint
      'oauth2/uacf/access_token/'
    end

    def headers
      {
        'content-type' => 'application/x-www-form-urlencoded',
        'api-key' => config.client_id,
        'accept' => 'application/json'
      }
    end

    def data
      {
        client_id: client_id,
        client_secret: client_secret,
        grant_type: 'authorization_code',
        code: code
      }
    end

    def after_init(args)
      @code = args[:code]
      raise 'code required' if @code.nil?
    end
  end
end
