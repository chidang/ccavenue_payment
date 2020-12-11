require 'ccavenue/version'
require 'ccavenue/crypto'
require 'ccavenue/config'

module Ccavenue
  class Payment
    # Create request object
    # === Options(Hash)
    def self.encryped_data(data)
      data.merge!({ merchant_id: Config.merchant_id }).to_query
      crypto.encrypt(data)
    end

    def self.decrypted_data(encrypted_string)
      crypto.decrypt(encrypted_string)
    end

    private

    def self.crypto
      Crypto.new(working_key: Config.working_key)
    end
  end
end
