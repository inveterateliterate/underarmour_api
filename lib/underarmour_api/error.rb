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

      def initialize(response)
        @response = response
        super(response)
      end

      def to_s
        "#{self.class}: #{response.code} #{error_message}"
      end

      def error_message
        JSON.parse(response.body)['_diagnostics']['validation_failures'].first.first
      end

      def self.raise_error(response)
        klass = UnderarmourApi::Error.const_get HTTP_ERROR_CLASSES[response.code]
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
