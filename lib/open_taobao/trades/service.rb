module OpenTaobao
  module Trades
    module Service
      #查询卖家已卖出的交易数据（根据创建时间）
      TAOBAO_TRADES_SOLD_GET = %w( session fields )
      def self.taobao_trades_sold_get(params, options = {})
        params = OpenTaobao::Utils.stringify_keys(params)
        OpenTaobao::Validation.check_required_params(params, TAOBAO_TRADES_SOLD_GET)
        OpenTaobao::Validation.check_gateway_url(OpenTaobao.gateway_url)

        app_key = options[:app_key] || OpenTaobao.app_key
        app_secret = options[:app_secret] || OpenTaobao.app_secret
        sign_method = (options[:sign_method] || :md5).to_s
        return_format = (options[:return_format] || :json).to_s

        real_params = OpenTaobao::Utils.base_params('taobao.trades.sold.get', app_key, sign_method, return_format).merge({
                 "session"    => params["session"],
                 "fields"     => params["fields"]
          })

        real_params = real_params.merge("start_created" => params["start_created"]) if params["start_created"].present?
        real_params = real_params.merge("end_created" => params["end_created"]) if params["end_created"].present?
        real_params = real_params.merge("status" => params["status"]) if params["status"].present?
        real_params = real_params.merge("buyer_nick" => params["buyer_nick"]) if params["buyer_nick"].present?
        real_params = real_params.merge("type" => params["type"]) if params["type"].present?
        real_params = real_params.merge("ext_type" => params["ext_type"]) if params["ext_type"].present?
        real_params = real_params.merge("rate_status" => params["rate_status"]) if params["rate_status"].present?
        real_params = real_params.merge("tag" => params["tag"]) if params["tag"].present?
        real_params = real_params.merge("page_no" => params["page_no"]) if params["page_no"].present?
        real_params = real_params.merge("page_size" => params["page_size"]) if params["page_size"].present?
        real_params = real_params.merge("use_has_next" => params["use_has_next"]) if params["use_has_next"].present?

        signed_params = real_params.merge("sign" => OpenTaobao::Utils.get_sign(real_params, app_secret, sign_method))

        OpenTaobao::Utils.url_with_params signed_params, OpenTaobao.gateway_url
      end

      #获取单笔交易的详细信息
      TAOBAO_TRADE_FULLINFO_GET = %w( session fields tid )
      def self.taobao_trade_fullinfo_get(params, options = {})
        params = OpenTaobao::Utils.stringify_keys(params)
        OpenTaobao::Validation.check_required_params(params, TAOBAO_TRADE_FULLINFO_GET)
        OpenTaobao::Validation.check_gateway_url(OpenTaobao.gateway_url)

        app_key = options[:app_key] || OpenTaobao.app_key
        app_secret = options[:app_secret] || OpenTaobao.app_secret
        sign_method = (options[:sign_method] || :md5).to_s
        return_format = (options[:return_format] || :json).to_s

        params = OpenTaobao::Utils.base_params('taobao.trade.fullinfo.get', app_key, sign_method, return_format).merge({
                 "session"    => params["session"],
                 "fields"     => params["fields"],
                 "tid"        => params["tid"]
          })

        signed_params = params.merge("sign" => OpenTaobao::Utils.get_sign(params, app_secret, sign_method))

        OpenTaobao::Utils.url_with_params signed_params, OpenTaobao.gateway_url
      end
    end
  end
end
