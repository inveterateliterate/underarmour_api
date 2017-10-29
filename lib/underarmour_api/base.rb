module UnderArmourApi
  # API wrapper
  class Base
    def initialize(_args={})
      after_init
    end

    #  cna combine get and post with send(:request_method)
    def get
      HTTParty.get(url, payload)
    end

    def post
      HTTParty.post(url, payload)
    end

    private

    def url
      "#{base_url}#{endpoint}"
    end

    def base_url
      'https://api.ua.com/v7.1/'
    end

    def endpoint
      raise 'endpoint required by subclasses'
    end

    def payload
      {
        body: data,
        headers: headers
      }
    end

    def data
      {}
    end

    def headers
      {}
    end

    def after_init(args)
      # hook for subclasses
    end
  end
end
