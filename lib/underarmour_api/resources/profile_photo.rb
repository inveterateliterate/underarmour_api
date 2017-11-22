module UnderarmourApi
  module Resources
    class ProfilePhoto < Resources::Base
      attr_reader :photo_size

      SIZES = %w(small medium large)

      def after_init(args={})
        @photo_size = args[:size].to_s
        @endpoint = "user_profile_photo/#{args[:id]}"
      end

      def all
        request(:get)['_links']
      end

      def image
        photo_size_error unless SIZES.include? photo_size
        all.dig(photo_size, 0, 'href')
      end

      def photo_size_error
        raise UnderarmourApi::Error::InvalidArgument.new(invalid_photo_size)
      end

      def invalid_photo_size
        'size argument must be one of: ' + SIZES.join(', ')
      end
    end
  end
end
