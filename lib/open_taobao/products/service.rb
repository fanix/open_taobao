module OpenTaobao
  module Products
    module Service
      #根据商品ID列表获取SKU信息
      TAOBAO_ITEM_SKUS_GET = %w()
      def self.taobao_item_skus_get(params = {}, options = {})
        app_key = options[:app_key] || OpenTaobao.app_key
        sign_method = (options[:sign_method] || :md5).to_s.upcase
        return_format = (options[:return_format] || :json).to_s.upcase

        params = {
          method: 'taobao.item.skus.get'
          app_key: app_key,
          sign_method: sign_method,
          timestamp: Time.now.utc.strftime('%Y-%m-%d %H:%M:%S').to_s,
          format: return_format,
          v: '2.0'
        }
      end

      #获取当前会话用户出售中的商品列表
      TAOBAO_ITEMS_ONSALE_GET = %w()
      def self.taobao_items_onsale_get(params = {}, options = {})
        app_key = options[:app_key] || OpenTaobao.app_key
        sign_method = (options[:sign_method] || :md5).to_s.upcase
        return_format = (options[:return_format] || :json).to_s.upcase

        params = {
          method: 'taobao.items.onsale.get'
          app_key: app_key,
          sign_method: sign_method,
          timestamp: Time.now.utc.strftime('%Y-%m-%d %H:%M:%S').to_s,
          format: return_format,
          v: '2.0'
        }
      end

      #得到当前会话用户库存中的商品列表
      TAOBAO_ITEMS_INVENTORY_GET = %w()
      def self.taobao_items_inventory_get(params = {}, options = {})
        app_key = options[:app_key] || OpenTaobao.app_key
        sign_method = (options[:sign_method] || :md5).to_s.upcase
        return_format = (options[:return_format] || :json).to_s.upcase

        params = {
          method: 'taobao.items.inventory.get'
          app_key: app_key,
          sign_method: sign_method,
          timestamp: Time.now.utc.strftime('%Y-%m-%d %H:%M:%S').to_s,
          format: return_format,
          v: '2.0'
        }
      end

      #获取单个商品详细信息
      TAOBAO_ITEM_SELLER_GET = %w()
      def self.taobao_item_seller_get(params = {}, options = {})
        app_key = options[:app_key] || OpenTaobao.app_key
        sign_method = (options[:sign_method] || :md5).to_s.upcase
        return_format = (options[:return_format] || :json).to_s.upcase

        params = {
          method: 'taobao.item.seller.get'
          app_key: app_key,
          sign_method: sign_method,
          timestamp: Time.now.utc.strftime('%Y-%m-%d %H:%M:%S').to_s,
          format: return_format,
          v: '2.0'
        }
      end

      #商品优惠详情查询
      TAOBAO_UMP_PROMOTION_GET = %w()
      def self.taobao_ump_promotion_get(params = {}, options = {})
        app_key = options[:app_key] || OpenTaobao.app_key
        sign_method = (options[:sign_method] || :md5).to_s.upcase
        return_format = (options[:return_format] || :json).to_s.upcase

        params = {
          method: 'taobao.ump.promotion.get'
          app_key: app_key,
          sign_method: sign_method,
          timestamp: Time.now.utc.strftime('%Y-%m-%d %H:%M:%S').to_s,
          format: return_format,
          v: '2.0'
        }
      end
    end
  end
end
