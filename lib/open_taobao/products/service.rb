module OpenTaobao
  module Products
    module Service
      #根据商品ID列表获取SKU信息
      TAOBAO_ITEM_SKUS_GET = %w( fields num_iids )
      def self.taobao_item_skus_get(params, options = {})
        params = OpenTaobao::Utils.stringify_keys(params)
        OpenTaobao::Validation.check_required_params(params, TAOBAO_ITEM_SKUS_GET)
        OpenTaobao::Validation.check_gateway_url(OpenTaobao.gateway_url)

        app_key = options[:app_key] || OpenTaobao.app_key
        app_secret = options[:app_secret] || OpenTaobao.app_secret
        sign_method = (options[:sign_method] || :md5).to_s
        return_format = (options[:return_format] || :json).to_s

        params = OpenTaobao::Utils.base_params('taobao.item.skus.get', app_key, sign_method, return_format).merge({
                 "fields"    => params["fields"],
                 "num_iids"    => params["num_iids"]
          })

        signed_params = params.merge("sign" => OpenTaobao::Utils.get_sign(params, app_secret, sign_method))

        OpenTaobao::Utils.url_with_params signed_params, OpenTaobao.gateway_url
      end

      #获取当前会话用户出售中的商品列表
      TAOBAO_ITEMS_ONSALE_GET = %w( session fields )
      def self.taobao_items_onsale_get(params, options = {})
        params = OpenTaobao::Utils.stringify_keys(params)
        OpenTaobao::Validation.check_required_params(params, TAOBAO_ITEMS_ONSALE_GET)
        OpenTaobao::Validation.check_gateway_url(OpenTaobao.gateway_url)

        app_key = options[:app_key] || OpenTaobao.app_key
        app_secret = options[:app_secret] || OpenTaobao.app_secret
        sign_method = (options[:sign_method] || :md5).to_s
        return_format = (options[:return_format] || :json).to_s

        real_params = OpenTaobao::Utils.base_params('taobao.items.onsale.get', app_key, sign_method, return_format).merge({
                 "session"    => params["session"],
                 "fields"    => params["fields"]
          })

        real_params = real_params.merge("q" => params["q"]) if params["q"].present?
        real_params = real_params.merge("cid" => params["cid"]) if params["cid"].present?
        real_params = real_params.merge("seller_cids" => params["seller_cids"]) if params["seller_cids"].present?
        real_params = real_params.merge("page_no" => params["page_no"]) if params["page_no"].present?
        real_params = real_params.merge("has_discount" => params["has_discount"]) if params["has_discount"].present?
        real_params = real_params.merge("has_showcase" => params["tid"]) if params["has_showcase"].present?
        real_params = real_params.merge("order_by" => params["num_iid"]) if params["order_by"].present?
        real_params = real_params.merge("is_taobao" => params["is_taobao"]) if params["is_taobao"].present?
        real_params = real_params.merge("is_ex" => params["is_ex"]) if params["is_ex"].present?
        real_params = real_params.merge("page_size" => params["page_size"]) if params["page_size"].present?
        real_params = real_params.merge("start_modified" => params["start_modified"]) if params["start_modified"].present?
        real_params = real_params.merge("end_modified" => params["end_modified"]) if params["end_modified"].present?
        real_params = real_params.merge("is_cspu" => params["tid"]) if params["is_cspu"].present?
        real_params = real_params.merge("is_combine" => params["is_combine"]) if params["is_combine"].present?

        signed_params = real_params.merge("sign" => OpenTaobao::Utils.get_sign(real_params, app_secret, sign_method))

        OpenTaobao::Utils.url_with_params signed_params, OpenTaobao.gateway_url
      end

      #得到当前会话用户库存中的商品列表
      TAOBAO_ITEMS_INVENTORY_GET = %w( session fields )
      def self.taobao_items_inventory_get(params, options = {})
        params = OpenTaobao::Utils.stringify_keys(params)
        OpenTaobao::Validation.check_required_params(params, TAOBAO_ITEMS_INVENTORY_GET)
        OpenTaobao::Validation.check_gateway_url(OpenTaobao.gateway_url)

        app_key = options[:app_key] || OpenTaobao.app_key
        app_secret = options[:app_secret] || OpenTaobao.app_secret
        sign_method = (options[:sign_method] || :md5).to_s
        return_format = (options[:return_format] || :json).to_s

        real_params = OpenTaobao::Utils.base_params('taobao.items.inventory.get', app_key, sign_method, return_format).merge({
                 "session"    => params["session"],
                 "fields"    => params["fields"]
          })

        real_params = real_params.merge("q" => params["q"]) if params["q"].present?
        real_params = real_params.merge("banner" => params["banner"]) if params["banner"].present?
        real_params = real_params.merge("cid" => params["cid"]) if params["cid"].present?
        real_params = real_params.merge("seller_cids" => params["seller_cids"]) if params["seller_cids"].present?
        real_params = real_params.merge("page_no" => params["page_no"]) if params["page_no"].present?
        real_params = real_params.merge("has_discount" => params["has_discount"]) if params["has_discount"].present?
        real_params = real_params.merge("order_by" => params["num_iid"]) if params["order_by"].present?
        real_params = real_params.merge("is_taobao" => params["is_taobao"]) if params["is_taobao"].present?
        real_params = real_params.merge("is_ex" => params["is_ex"]) if params["is_ex"].present?
        real_params = real_params.merge("page_size" => params["page_size"]) if params["page_size"].present?
        real_params = real_params.merge("start_modified" => params["start_modified"]) if params["start_modified"].present?
        real_params = real_params.merge("end_modified" => params["end_modified"]) if params["end_modified"].present?
        real_params = real_params.merge("is_cspu" => params["tid"]) if params["is_cspu"].present?


        signed_params = real_params.merge("sign" => OpenTaobao::Utils.get_sign(real_params, app_secret, sign_method))

        OpenTaobao::Utils.url_with_params signed_params, OpenTaobao.gateway_url
      end

      #获取单个商品详细信息
      TAOBAO_ITEM_SELLER_GET = %w( session fields num_iid )
      def self.taobao_item_seller_get(params, options = {})
        params = OpenTaobao::Utils.stringify_keys(params)
        OpenTaobao::Validation.check_required_params(params, TAOBAO_ITEM_SELLER_GET)
        OpenTaobao::Validation.check_gateway_url(OpenTaobao.gateway_url)

        app_key = options[:app_key] || OpenTaobao.app_key
        app_secret = options[:app_secret] || OpenTaobao.app_secret
        sign_method = (options[:sign_method] || :md5).to_s
        return_format = (options[:return_format] || :json).to_s

        params = OpenTaobao::Utils.base_params('taobao.item.seller.get', app_key, sign_method, return_format).merge({
                 "session"    => params["session"],
                 "fields"    => params["fields"],
                 "num_iid"    => params["num_iid"]
          })

        signed_params = params.merge("sign" => OpenTaobao::Utils.get_sign(params, app_secret, sign_method))

        OpenTaobao::Utils.url_with_params signed_params, OpenTaobao.gateway_url
      end

      #商品优惠详情查询
      TAOBAO_UMP_PROMOTION_GET = %w( item_id )
      def self.taobao_ump_promotion_get(params, options = {})
        params = OpenTaobao::Utils.stringify_keys(params)
        OpenTaobao::Validation.check_required_params(params, TAOBAO_UMP_PROMOTION_GET)
        OpenTaobao::Validation.check_gateway_url(OpenTaobao.gateway_url)

        app_key = options[:app_key] || OpenTaobao.app_key
        app_secret = options[:app_secret] || OpenTaobao.app_secret
        sign_method = (options[:sign_method] || :md5).to_s
        return_format = (options[:return_format] || :json).to_s

        params = OpenTaobao::Utils.base_params('taobao.ump.promotion.get', app_key, sign_method, return_format).merge({
                 "item_id"    => params["item_id"]
          })

        signed_params = params.merge("sign" => OpenTaobao::Utils.get_sign(params, app_secret, sign_method))

        OpenTaobao::Utils.url_with_params signed_params, OpenTaobao.gateway_url
      end
    end
  end
end
