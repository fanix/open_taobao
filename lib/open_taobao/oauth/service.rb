module OpenTaobao
  module Oauth
    module Service
      #获取Access Token
      TAOBAO_TOP_AUTH_TOKEN_CREATE = %w( code )
      def self.taobao_top_auth_token_create(params, options = {})
        OpenTaobao::Validation.check_gateway_url(OpenTaobao.oauth_token_gateway_url)

        params = OpenTaobao::Utils.stringify_keys(params)
        OpenTaobao::Validation.check_required_params(params, TAOBAO_TOP_AUTH_TOKEN_CREATE)

        app_key = options[:app_key] || OpenTaobao.app_key
        app_secret = options[:app_secret] || OpenTaobao.app_secret
        sign_method = (options[:sign_method] || :md5).to_s
        return_format = (options[:return_format] || :json).to_s

        params = OpenTaobao::Utils.base_params('taobao.top.auth.token.create', app_key, sign_method, return_format).merge({
                 "code"    => params["code"]
          })

        signed_params = params.merge("sign" => OpenTaobao::Utils.get_sign(params, app_secret, sign_method))

        OpenTaobao::Utils.url_with_params signed_params, OpenTaobao.oauth_token_gateway_url
      end
    end
  end
end
