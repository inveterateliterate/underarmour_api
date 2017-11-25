module UnderarmourApi
  class Client
    attr_reader :config, :user

    # returns a client with id and secret
    def initialize(args={})
      configure(args)
    end

    def configure(args={})
      @config = args.nil? ? yield(Config.new) : Config.new(args)
      if config.nil? || !config.valid_key_names?(args.keys) # can pass in no access token to get base token
        @config = nil
        raise Error::InvalidAPIKeys
      else
        fetch_access_token(args) unless config.access_token
        # config.freeze
      end
    end

    def fetch_access_token(args)
      config.access_token = UnderarmourApi::Resources::Authorization.new(self, args).fetch_access_token
    end

    def user
      # only if user access token passed in
      @user ||= UnderarmourApi::User.me(self)
    end

    def workouts
      user.workouts
    end
  end
end
