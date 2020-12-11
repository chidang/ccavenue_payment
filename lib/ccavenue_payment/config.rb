module CcavenuePayment
  class Config
    class << self
      def merchant_id
        ENV.fetch('CCAVENUE_MERCHANT_ID').freeze
      end

      def working_key
        ENV.fetch('CCAVENUE_WORKING_KEY').freeze
      end

      def access_code
        ENV.fetch('CCAVENUE_ACCESS_CODE').freeze
      end

      def mode
        ENV.fetch('CCAVENUE_MODE').freeze
      end
    end
  end
end
