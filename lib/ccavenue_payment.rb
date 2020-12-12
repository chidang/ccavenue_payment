require 'ccavenue_payment/version'
require 'ccavenue_payment/crypto'
require 'ccavenue_payment/config'

module Ccavenue
  module Payment
    class << self
      # Create request object
      # === Options(Hash)
      def encryped_data(data)
        data.merge!({ merchant_id: Config.merchant_id }).to_query
        crypto.encrypt(data)
      end

      def decrypted_data(encrypted_string)
        crypto.decrypt(encrypted_string)
      end

      private

      def crypto
        @crypto ||= Crypto.new(working_key: Config.working_key)
      end
    end
  end
end
