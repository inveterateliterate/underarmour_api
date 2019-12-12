module UnderarmourApi
  class Client
    attr_reader :config, :user

    # returns a client with id and secret. If passed on, access token is added to the client otherwise it will be fetched
    def initialize(args={})
      configure(args)
    end

    def configure(args={})
      @config = args.empty? ? UnderarmourApi.config : Config.new(args)
      if config.nil? || !config.valid_key_names?(args.keys)
        @config = nil
        raise Error::InvalidAPIKeys
      else
        fetch_access_token(args) unless config.access_token
        # config.freeze
      end
    end

    def fetch_access_token(args)
      config.access_token = UnderarmourApi::Resources::Authorization.new(self, args).fetch_access_token
      self
    end

    def set_access_token(args)
      config.access_token = args[:access_token]
      self
    end

    def user
      # only if user access token passed in
      @user ||= UnderarmourApi::User.me(self)
    end
  end
end
