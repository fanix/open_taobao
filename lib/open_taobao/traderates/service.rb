module OpenTaobao
  module Traderates
    module Service
      #搜索评价信息
      TAOBAO_TRADERATES_GET = %w()
      def self.taobao_traderates_get(params = {}, options = {})
        app_key = options[:app_key] || OpenTaobao.app_key
        sign_method = (options[:sign_method] || :md5).to_s.upcase
        return_format = (options[:return_format] || :json).to_s.upcase

        params = {
          method: 'taobao.traderates.get'
          app_key: app_key,
          sign_method: sign_method,
          timestamp: Time.now.utc.strftime('%Y-%m-%d %H:%M:%S').to_s,
          format: return_format,
          v: '2.0'
        }
      end
    end
  end
end
