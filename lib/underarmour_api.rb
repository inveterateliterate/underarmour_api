require 'httparty'
require 'json'
require 'pry'

require 'underarmour_api/resources/base'
require 'underarmour_api/resources/authorization'
require 'underarmour_api/base'
require 'underarmour_api/client'
require 'underarmour_api/config'
require 'underarmour_api/error'
require 'underarmour_api/version'
# require 'underarmour_api/railtie' if defined?(::Rails)

%w(user workout).each { |f| require "underarmour_api/#{f}"}
%w(user profile_photo workout user_stats).each { |f| require "underarmour_api/resources/#{f}"}

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

