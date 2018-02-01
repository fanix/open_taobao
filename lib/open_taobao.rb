require "openssl"
require "uri"
require "rest-client"
require "json"

module OpenTaobao
  class << self
    attr_accessor :app_key, :app_secret
  end
end

require_relative "open_taobao/version"
require_relative "open_taobao/error"
require_relative "open_taobao/service"
require_relative "open_taobao/sign"
require_relative "open_taobao/utils"
require_relative "open_taobao/validation"

require_relative "open_taobao/fenxiao/service"
require_relative "open_taobao/logistics/service"
require_relative "open_taobao/messages/service"
require_relative "open_taobao/products/service"
require_relative "open_taobao/traderates/service"
require_relative "open_taobao/trades/service"
