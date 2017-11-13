module UnderarmourApi
  class Client
    attr_reader :config

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
        fetch_access_token unless config.access_token
        config.freeze
      end
    end

    def fetch_access_token
      # client or user?
      # config.access_token = UnderarmourApi::Resources::Authorization.new(self).fetch_access_token
      config.access_token = UnderarmourApi::Authorizations::ClientAuthorization.new(self).fetch_access_token
    end
  end
end
