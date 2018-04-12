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

        real_params = OpenTaobao::Utils.base_params('taobao.traderates.get', app_key, sign_method, return_format).merge({
                 "session"    => params["session"],
                 "fields"     => params["fields"],
                 "rate_type"  => params["rate_type"],
                 "role"       => params["role"]
          })

        real_params.merge("result" => params["result"]) if params["result"].present?
        real_params.merge("page_no" => params["page_no"]) if params["page_no"].present?
        real_params.merge("page_size" => params["page_size"]) if params["page_size"].present?
        real_params.merge("start_date" => params["start_date"]) if params["start_date"].present?
        real_params.merge("end_date" => params["end_date"]) if params["end_date"].present?
        real_params.merge("tid" => params["tid"]) if params["tid"].present?
        real_params.merge("num_iid" => params["num_iid"]) if params["num_iid"].present?
        real_params.merge("use_has_next" => params["use_has_next"]) if params["use_has_next"].present?

        signed_params = params.merge("sign" => OpenTaobao::Utils.get_sign(real_params, app_secret, sign_method))

        OpenTaobao::Utils.url_with_params signed_params, OpenTaobao.gateway_url
      end
    end
  end
end
