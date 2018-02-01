module OpenTaobao
  module Logistics
    module Service
      #自己联系物流（线下物流）发货
      TAOBAO_LOGISTICS_OFFLINE_SEND = %w( session )
      def self.taobao_logistics_offline_send(params, options = {})
        params = OpenTaobao::Utils.stringify_keys(params)
        OpenTaobao::Validation.check_required_params(params, TAOBAO_LOGISTICS_OFFLINE_SEND)

        app_key = options[:app_key] || OpenTaobao.app_key
        sign_method = (options[:sign_method] || :md5).to_s.upcase
        return_format = (options[:return_format] || :json).to_s.upcase

        params = OpenTaobao::Utils.base_params('taobao.logistics.offline.send', app_key, sign_method, return_format).merge({
                 "session"    => params["session"]
          })

        signed_params = params.merge("sign" => OpenTaobao::Utils.get_sign(params, key, sign_method))

        OpenTaobao::Utils.url_with_params signed_params
      end
    end
  end
end
