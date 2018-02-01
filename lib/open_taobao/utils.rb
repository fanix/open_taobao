module OpenTaobao
  class Utils
    class << self
      def to_signed hash app_secret
        "#{app_secret}"<<hash.sort.flatten.join<<"#{app_secret}"
      end
    end
  end
end
