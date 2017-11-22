module UnderarmourApi
  class Base
    # wrappers for resources
    attr_reader :client_id, :options, :token, :query, :user_num

    def initialize(client, token=nil, options={})
      @client_id = client.config.client_id
      @token = token || UnderarmourApi::Authorization.new(client).fetch_access_token
    # access token needed to authorize a user
      after_init(options)
      @options = options
      # @token = options[:token] || Authorization.new(client).fetch_access_token
      # after_init
    end

    def self.find(id, type)
     endpoint =
    end

    def user
      UnderArmourApi::Resources::Base.new(client, )
    end

    def user_role
    end

    def user_stats
    end

    def activity_story
    end

    def friendship
    end

    def workout
    end

    def course
    end

    def data_source
    end


    def social
    end


    # 24/7
  end
end
