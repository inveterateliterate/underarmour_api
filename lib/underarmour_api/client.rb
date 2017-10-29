module UnderArmourApi
  class Client
    attr_reader :config

    # returns a client with id and secret
    def initialize(args={})
      configure(args)
    end

    # grab configuration keys
    # modeled after Yelp API gem
    def configure(args)
      @config = args.nil? ? yield(Config.new) : Config.new(args)
      if config.nil? || !config.valid_key_names?(args.keys)
        @config = nil
        raise Error::InvalidAPIKeys
      else
        config.freeze
      end
    end

    def connect
      # authorize
    end
  end
end
