module OpenTaobao
  class Sign
    class << self
      def md5(string)
        Digest::MD5.hexdigest(string).upcase
      end

      def hmac(string)
        HMAC::MD5.new(string).digest
      end
    end
  end
end
