module OpenTaobao
  module Messages
    module Service
      #为已授权的用户开通消息服务
      TAOBAO_TMC_USER_PERMIT = %w( session )
      def self.taobao_tmc_user_permit(params, options = {})
        params = OpenTaobao::Utils.stringify_keys(params)
        OpenTaobao::Validation.check_required_params(params, TAOBAO_TMC_USER_PERMIT)
        OpenTaobao::Validation.check_gateway_url(OpenTaobao.gateway_url)

        app_key = options[:app_key] || OpenTaobao.app_key
        app_secret = options[:app_secret] || OpenTaobao.app_secret
        sign_method = (options[:sign_method] || :md5).to_s
        return_format = (options[:return_format] || :json).to_s

        real_params = OpenTaobao::Utils.base_params('taobao.tmc.user.permit', app_key, sign_method, return_format).merge({
                 "session"    => params["session"]
          })

        real_params = real_params.merge("topics" => params["topics"]) if params["topics"].present?

        signed_params = real_params.merge("sign" => OpenTaobao::Utils.get_sign(real_params, app_secret, sign_method))

        OpenTaobao::Utils.url_with_params signed_params, OpenTaobao.gateway_url
      end

      #消费多条消息
      def self.taobao_tmc_messages_consume(params, options = {})
        params = OpenTaobao::Utils.stringify_keys(params)
        OpenTaobao::Validation.check_gateway_url(OpenTaobao.gateway_url)

        app_key = options[:app_key] || OpenTaobao.app_key
        app_secret = options[:app_secret] || OpenTaobao.app_secret
        sign_method = (options[:sign_method] || :md5).to_s
        return_format = (options[:return_format] || :json).to_s

        real_params = OpenTaobao::Utils.base_params('taobao.tmc.messages.consume', app_key, sign_method, return_format)

        real_params = real_params.merge("group_name" => params["group_name"]) if params["group_name"].present?
        real_params = real_params.merge("quantity" => params["quantity"]) if params["quantity"].present?

        signed_params = real_params.merge("sign" => OpenTaobao::Utils.get_sign(real_params, app_secret, sign_method))

        OpenTaobao::Utils.url_with_params signed_params, OpenTaobao.gateway_url
      end

      #确认消费消息的状态
      TAOBAO_TMC_MESSAGES_CONFIRM = %w( s_message_ids )
      def self.taobao_tmc_messages_confirm(params, options = {})
        params = OpenTaobao::Utils.stringify_keys(params)
        OpenTaobao::Validation.check_required_params(params, TAOBAO_TMC_MESSAGES_CONFIRM)
        OpenTaobao::Validation.check_gateway_url(OpenTaobao.gateway_url)

        app_key = options[:app_key] || OpenTaobao.app_key
        app_secret = options[:app_secret] || OpenTaobao.app_secret
        sign_method = (options[:sign_method] || :md5).to_s
        return_format = (options[:return_format] || :json).to_s

        real_params = OpenTaobao::Utils.base_params('taobao.tmc.messages.confirm', app_key, sign_method, return_format).merge({
                 "s_message_ids"    => params["s_message_ids"]
          })

        real_params = real_params.merge("group_name" => params["group_name"]) if params["group_name"].present?

        signed_params = real_params.merge("sign" => OpenTaobao::Utils.get_sign(real_params, app_secret, sign_method))

        OpenTaobao::Utils.url_with_params signed_params, OpenTaobao.gateway_url
      end
    end
  end
end
