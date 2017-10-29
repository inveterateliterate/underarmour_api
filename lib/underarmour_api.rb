require 'httparty'
require 'json'

require 'underarmour_api/config'
require 'underarmour_api/error'
require 'underarmour_api/version'
# require 'underarmour_api/railtie' if defined?(::Rails)

module UnderArmourApi
  def self.config
    @config ||= UnderArmourApi::Config.new
    if block_given?
      yield @config
    else
      @config
    end
  end
end

