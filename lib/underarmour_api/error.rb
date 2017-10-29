module UnderArmourApi
  module Error

    class Base < StandardError
      def initialize(msg,error=nil)
        super(msg)
      end
    end

    class InvalidAPIKeys < Base
      def initialize(msg = 'API keys are either missing or incorrectly named.', error=nil)
        super
      end
    end
  end
end
