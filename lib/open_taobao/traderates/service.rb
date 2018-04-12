module OpenTaobao
  module Traderates
    module Service
      #搜索评价信息
      TAOBAO_TRADERATES_GET = %w( session fields rate_type role )
      def self.taobao_traderates_get(params, options = {})
        params = OpenTaobao::Utils.stringify_keys(params)
        OpenTaobao::Validation.check_required_params(params, TAOBAO_TRADERATES_GET)
        OpenTaobao::Validation.check_gateway_url(OpenTaobao.gateway_url)

        app_key = options[:app_key] || OpenTaobao.app_key
        app_secret = options[:app_secret] || OpenTaobao.app_secret
        sign_method = (options[:sign_method] || :md5).to_s
        return_format = (options[:return_format] || :json).to_s

        params = OpenTaobao::Utils.base_params('taobao.traderates.get', app_key, sign_method, return_format).merge({
                 "session"    => params["session"],
                 "fields"     => params["fields"],
                 "rate_type"  => params["rate_type"],
                 "role"       => params["role"]
          })

        params["result"] => params["result"] if params["result"].present?
        params["page_no"] => params["page_no"] if params["page_no"].present?
        params["page_size"] => params["page_size"] if params["page_size"].present?
        params["start_date"] => params["start_date"] if params["start_date"].present?
        params["end_date"] => params["end_date"] if params["end_date"].present?
        params["tid"] => params["tid"] if params["tid"].present?
        params["num_iid"] => params["num_iid"] if params["num_iid"].present?
        params["use_has_next"] => params["use_has_next"] if params["use_has_next"].present?

        signed_params = params.merge("sign" => OpenTaobao::Utils.get_sign(params, app_secret, sign_method))

        OpenTaobao::Utils.url_with_params signed_params, OpenTaobao.gateway_url
      end
    end
  end
end
