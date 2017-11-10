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
        config.freeze
      end
    end
  end
end
