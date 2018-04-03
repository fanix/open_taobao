module OpenTaobao
  module Trades
    module Service
      #查询卖家已卖出的交易数据（根据创建时间）
      TAOBAO_TRADES_SOLD_GET = %w( session fields )
      def self.taobao_trades_sold_get(params, options = {})
        params = OpenTaobao::Utils.stringify_keys(params)
        OpenTaobao::Validation.check_required_params(params, TAOBAO_TRADES_SOLD_GET)

        app_key = options[:app_key] || OpenTaobao.app_key
        app_secret = options[:app_secret] || OpenTaobao.app_secret
        sign_method = (options[:sign_method] || :md5).to_s
        return_format = (options[:return_format] || :json).to_s

        params = OpenTaobao::Utils.base_params('taobao.trades.sold.get', app_key, sign_method, return_format).merge({
                 "session"    => params["session"],
                 "fields"     => params["fields"]
          })

        signed_params = params.merge("sign" => OpenTaobao::Utils.get_sign(params, app_secret, sign_method))

        OpenTaobao::Utils.url_with_params signed_params
      end

      #获取单笔交易的详细信息
      TAOBAO_TRADE_FULLINFO_GET = %w( session fields tid )
      def self.taobao_trade_fullinfo_get(params, options = {})
        params = OpenTaobao::Utils.stringify_keys(params)
        OpenTaobao::Validation.check_required_params(params, TAOBAO_TRADE_FULLINFO_GET)

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

        OpenTaobao::Utils.url_with_params signed_params
      end
    end
  end
end
