require "ccavenue_payment/version"
require "ccavenue_payment/config"
require "ccavenue_payment/crypto"

module CcavenuePayment
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

    def request_url
      if Config.mode.upcase == 'TEST'
        "https://test.ccavenue.com/transaction/transaction.do?command=initiateTransaction"
      elsif Config.mode.upcase == 'LIVE'
        "https://secure.ccavenue.com/transaction/transaction.do?command=initiateTransaction"
      end
    end

    def access_code
      @access_code ||= Config.access_code
    end

    private

    def crypto
      @crypto ||= Crypto.new(working_key: Config.working_key)
    end
  end
end
