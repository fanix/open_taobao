module OpenTaobao
  class Sign
    class << self
      def md5
        Digest::MD5.hexdigest(string)
      end

      def hmac
        HMAC::MD5.new(string).digest
      end
    end
  end
end
