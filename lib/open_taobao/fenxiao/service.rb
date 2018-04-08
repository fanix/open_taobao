module OpenTaobao
  module Fenxiao
    module Service
      #批量查询采购申请/经销采购单
      TAOBAO_FENXIAO_DEALER_REQUISITIONORDER_GET = %w( session )
      def self.taobao_fenxiao_dealer_requisitionorder_get(params, options = {})
        params = OpenTaobao::Utils.stringify_keys(params)
        OpenTaobao::Validation.check_required_params(params, TAOBAO_FENXIAO_DEALER_REQUISITIONORDER_GET)
        OpenTaobao::Validation.check_gateway_url(OpenTaobao.gateway_url)

        app_key = options[:app_key] || OpenTaobao.app_key
        app_secret = options[:app_secret] || OpenTaobao.app_secret
        sign_method = (options[:sign_method] || :md5).to_s
        return_format = (options[:return_format] || :json).to_s

        params = OpenTaobao::Utils.base_params('taobao.fenxiao.dealer.requisitionorder.get', app_key, sign_method, return_format).merge({
                 "session"    => params["session"],
                 "start_date" => params["start_date"],
                 "end_date" => params["end_date"]
          })

        signed_params = params.merge("sign" => OpenTaobao::Utils.get_sign(params, app_secret, sign_method))

        OpenTaobao::Utils.url_with_params signed_params, OpenTaobao.gateway_url
      end

      #查询采购单信息
      TAOBAO_FENXIAO_ORDERS_GET = %w( session )
      def self.taobao_fenxiao_orders_get(params, options = {})
        params = OpenTaobao::Utils.stringify_keys(params)
        OpenTaobao::Validation.check_required_params(params, TAOBAO_FENXIAO_ORDERS_GET)
        OpenTaobao::Validation.check_gateway_url(OpenTaobao.gateway_url)

        app_key = options[:app_key] || OpenTaobao.app_key
        app_secret = options[:app_secret] || OpenTaobao.app_secret
        sign_method = (options[:sign_method] || :md5).to_s
        return_format = (options[:return_format] || :json).to_s

        params = OpenTaobao::Utils.base_params('taobao.fenxiao.orders.get', app_key, sign_method, return_format).merge({
                 "session"    => params["session"]
          })

        signed_params = params.merge("sign" => OpenTaobao::Utils.get_sign(params, app_secret, sign_method))

        OpenTaobao::Utils.url_with_params signed_params, OpenTaobao.gateway_url
      end
    end
  end
end
