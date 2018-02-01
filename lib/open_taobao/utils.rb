require "uri"

module OpenTaobao
  class Utils
    class << self
      def to_sign hash app_secret
        "#{app_secret}"<<hash.sort.flatten.join<<"#{app_secret}"
      end

      def to_query hash
        hash.map{ |k, v| [k, URI.encode_www_form_component(v)].join("=") }.join("&")
      end
    end
  end
end
