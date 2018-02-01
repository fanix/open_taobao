require "openssl"

module OpenTaobao
  class MD5
    def self.sign(key, string)
      Digest::MD5.hexdigest("#{string}#{key}")
    end

    def self.verify?(key, string, sign)
      sign == sign(key, string)
    end
  end

  class HMAC
    def self.sign(key, string)
      digest = OpenSSL::Digest.new('sha1')
      OpenSSL::HMAC.digest(digest, key, string)
    end

    def self.verify?(key, string, sign)
      sign == sign(key, string)
    end
  end
end
