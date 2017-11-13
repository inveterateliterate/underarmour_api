require 'httparty'
require 'json'
require 'pry'

require 'underarmour_api/base'
require 'underarmour_api/resources/base'
require 'underarmour_api/resources/authorization'
require 'underarmour_api/client'
require 'underarmour_api/config'
require 'underarmour_api/error'
require 'underarmour_api/version'
# require 'underarmour_api/railtie' if defined?(::Rails)

require 'underarmour_api/authorizations/user_authentication'
require 'underarmour_api/authorizations/client_authorization'

%w(profile_photo privacy_policy user user_role user_stats).each { |f| require "underarmour_api/resources/#{f}"}

module UnderarmourApi
  def self.config
    @config ||= UnderarmourApi::Config.new
    if block_given?
      yield @config
    else
      @config
    end
  end
end

