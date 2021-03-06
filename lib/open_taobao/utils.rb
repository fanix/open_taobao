module OpenTaobao
  class Utils
    class << self
      def url_with_params signed_params, url
        [url, to_query(signed_params)].join("?")
      end

      def base_params(method, app_key, sign_method, return_format)
        {
          "app_key"       => app_key,
          "method"        => method,
          "sign_method"   => sign_method,
          "timestamp"     => Time.now.utc.strftime('%Y-%m-%d %H:%M:%S').to_s,
          "format"        => return_format,
          "v"             => '2.0'
        }
      end

      def stringify_keys hash
        new_hash = {}
        hash.each do |key, value|
          new_hash[(key.to_s rescue key) || key] = value
        end
        new_hash
      end

      def to_sign hash, app_secret
        "#{app_secret}#{sorted_hash_string hash}#{app_secret}"
      end

      def sorted_hash_string hash
        hash.map {|k, v| "#{k}#{v}" }.sort.join
      end

      def get_sign params, app_secret, sign_type
        string = to_sign(params, app_secret)
        case sign_type
        when 'md5'
          OpenTaobao::Sign.md5(string)
        else
          raise ArgumentError, "invalid sign_type #{sign_type}, allow value: 'MD5'"
        end
      end

      def to_query hash
        hash.map { |k, v| "#{k.to_s}=#{CGI::escape(v.to_s)}" }.join('&')
      end
    end
  end
end
