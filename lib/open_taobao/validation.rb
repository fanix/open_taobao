module OpenTaobao
  module Validation
    class << self
      def check_required_params(params, names)
        names.each do |name|
          warn("OpenTaobao Warn: missing required option: #{name}") unless params.has_key?(name)
        end
      end

      def check_gateway_url(url)
        raise "request url must request" unless url.present?
      end
    end
  end
end
