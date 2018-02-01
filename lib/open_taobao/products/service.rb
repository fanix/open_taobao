module OpenTaobao
  module Products
    module Service
      #根据商品ID列表获取SKU信息
      TAOBAO_ITEM_SKUS_GET = %w( fields num_iids )
      def self.taobao_item_skus_get(params, options = {})
        params = OpenTaobao::Utils.stringify_keys(params)
        OpenTaobao::Validation.check_required_params(params, TAOBAO_ITEM_SKUS_GET)

        app_key = options[:app_key] || OpenTaobao.app_key
        app_secret = options[:app_secret] || OpenTaobao.app_secret
        sign_method = (options[:sign_method] || :md5).to_s.upcase
        return_format = (options[:return_format] || :json).to_s.upcase

        params = OpenTaobao::Utils.base_params('taobao.item.skus.get', app_key, sign_method, return_format).merge({
                 "fields"    => params["fields"],
                 "num_iids"    => params["num_iids"]
          })

        signed_params = params.merge("sign" => OpenTaobao::Utils.get_sign(params, app_secret, sign_method))

        OpenTaobao::Utils.url_with_params signed_params
      end

      #获取当前会话用户出售中的商品列表
      TAOBAO_ITEMS_ONSALE_GET = %w( session fields )
      def self.taobao_items_onsale_get(params, options = {})
        params = OpenTaobao::Utils.stringify_keys(params)
        OpenTaobao::Validation.check_required_params(params, TAOBAO_ITEMS_ONSALE_GET)

        app_key = options[:app_key] || OpenTaobao.app_key
        app_secret = options[:app_secret] || OpenTaobao.app_secret
        sign_method = (options[:sign_method] || :md5).to_s.upcase
        return_format = (options[:return_format] || :json).to_s.upcase

        params = OpenTaobao::Utils.base_params('taobao.items.onsale.get', app_key, sign_method, return_format).merge({
                 "session"    => params["session"],
                 "fields"    => params["fields"]
          })

        signed_params = params.merge("sign" => OpenTaobao::Utils.get_sign(params, app_secret, sign_method))

        OpenTaobao::Utils.url_with_params signed_params
      end

      #得到当前会话用户库存中的商品列表
      TAOBAO_ITEMS_INVENTORY_GET = %w( session fields )
      def self.taobao_items_inventory_get(params, options = {})
        params = OpenTaobao::Utils.stringify_keys(params)
        OpenTaobao::Validation.check_required_params(params, TAOBAO_ITEMS_INVENTORY_GET)

        app_key = options[:app_key] || OpenTaobao.app_key
        app_secret = options[:app_secret] || OpenTaobao.app_secret
        sign_method = (options[:sign_method] || :md5).to_s.upcase
        return_format = (options[:return_format] || :json).to_s.upcase

        params = OpenTaobao::Utils.base_params('taobao.items.inventory.get', app_key, sign_method, return_format).merge({
                 "session"    => params["session"],
                 "fields"    => params["fields"]
          })

        signed_params = params.merge("sign" => OpenTaobao::Utils.get_sign(params, app_secret, sign_method))

        OpenTaobao::Utils.url_with_params signed_params
      end

      #获取单个商品详细信息
      TAOBAO_ITEM_SELLER_GET = %w( session fields num_iid )
      def self.taobao_item_seller_get(params, options = {})
        params = OpenTaobao::Utils.stringify_keys(params)
        OpenTaobao::Validation.check_required_params(params, TAOBAO_ITEM_SELLER_GET)

        app_key = options[:app_key] || OpenTaobao.app_key
        app_secret = options[:app_secret] || OpenTaobao.app_secret
        sign_method = (options[:sign_method] || :md5).to_s.upcase
        return_format = (options[:return_format] || :json).to_s.upcase

        params = OpenTaobao::Utils.base_params('taobao.item.seller.get', app_key, sign_method, return_format).merge({
                 "session"    => params["session"],
                 "fields"    => params["fields"],
                 "num_iid"    => params["num_iid"]
          })

        signed_params = params.merge("sign" => OpenTaobao::Utils.get_sign(params, app_secret, sign_method))

        OpenTaobao::Utils.url_with_params signed_params
      end

      #商品优惠详情查询
      TAOBAO_UMP_PROMOTION_GET = %w( item_id )
      def self.taobao_ump_promotion_get(params, options = {})
        params = OpenTaobao::Utils.stringify_keys(params)
        OpenTaobao::Validation.check_required_params(params, TAOBAO_UMP_PROMOTION_GET)

        app_key = options[:app_key] || OpenTaobao.app_key
        app_secret = options[:app_secret] || OpenTaobao.app_secret
        sign_method = (options[:sign_method] || :md5).to_s.upcase
        return_format = (options[:return_format] || :json).to_s.upcase

        params = OpenTaobao::Utils.base_params('taobao.ump.promotion.get', app_key, sign_method, return_format).merge({
                 "item_id"    => params["item_id"]
          })

        signed_params = params.merge("sign" => OpenTaobao::Utils.get_sign(params, app_secret, sign_method))

        OpenTaobao::Utils.url_with_params signed_params
      end
    end
  end
end
