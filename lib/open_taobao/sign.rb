module OpenTaobao
  class Sign
    class << self
      def md5(string)
        Digest::MD5.hexdigest(string).upcase
      end
    end
  end
end
