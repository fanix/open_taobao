module OpenTaobao
  module Trades
    module Service
      #查询卖家已卖出的交易数据（根据创建时间）
      TAOBAO_TRADES_SOLD_GET = %w()
      def self.taobao_trades_sold_get(params = {}, options = {})
        app_key = options[:app_key] || OpenTaobao.app_key
        sign_method = (options[:sign_method] || :md5).to_s.upcase
        return_format = (options[:return_format] || :json).to_s.upcase

        params = {
          method: 'taobao.trades.sold.get'
          app_key: app_key,
          sign_method: sign_method,
          timestamp: Time.now.utc.strftime('%Y-%m-%d %H:%M:%S').to_s,
          format: return_format,
          v: '2.0'
        }
      end

      #获取单笔交易的详细信息
      TAOBAO_TRADE_FULLINFO_GET = %w()
      def self.taobao_trade_fullinfo_get(params = {}, options = {})
        app_key = options[:app_key] || OpenTaobao.app_key
        sign_method = (options[:sign_method] || :md5).to_s.upcase
        return_format = (options[:return_format] || :json).to_s.upcase

        params = {
          method: 'taobao.trade.fullinfo.get'
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
