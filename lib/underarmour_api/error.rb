module UnderarmourApi
  module Error
    class Base < StandardError
      def initialize(msg, error=nil)
        super(msg)
      end
    end

    class InvalidAPIKeys < Base
      def initialize(msg = 'API keys are either missing or incorrectly named.', error=nil)
        super
      end
    end

    class InvalidArgument < Base
    end

    class HTTPError < StandardError
      attr_reader :response

      HTTP_ERROR_CLASSES = {
        400 => 'BadRequest',
        401 => 'Unauthorized',
        403 => 'Forbidden',
        404 => 'NotFound',
        405 => 'MethodNotAllowed',
        500 => 'ServerError'
      }

      def inititalize(response)
        @response = response
        super(response)
      end

      def to_s
        "#{self.class}: #{response.code} #{response.body}"
      end

      def self.raise_error(response)
        klass = HTTP_ERROR_CLASSES[response.code].constantize
        raise klass.new(response)
      end
    end

    class BadRequest < HTTPError; end
    class Unauthorized < HTTPError; end
    class Forbidden < HTTPError; end
    class NotFound < HTTPError; end
    class MethodNotAllowed < HTTPError; end
    class ServerError < HTTPError; end
  end
end
