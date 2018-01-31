module OpenTaobao
  module Logistics
    module Service
      #自己联系物流（线下物流）发货
      TAOBAO_LOGISTICS_OFFLINE_SEND = %w()
      def self.taobao_logistics_offline_send(params = {}, options = {})
        app_key = options[:app_key] || OpenTaobao.app_key
        sign_method = (options[:sign_method] || :md5).to_s.upcase
        return_format = (options[:return_format] || :json).to_s.upcase

        params = {
          method: 'taobao.logistics.offline.send'
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
