module OpenTaobao
  module Messages
    module Service
      #为已授权的用户开通消息服务
      TAOBAO_TMC_USER_PERMIT = %w()
      def self.taobao_tmc_user_permit(params = {}, options = {})
        app_key = options[:app_key] || OpenTaobao.app_key
        sign_method = (options[:sign_method] || :md5).to_s.upcase
        return_format = (options[:return_format] || :json).to_s.upcase

        params = {
          method: 'taobao.tmc.user.permit'
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
