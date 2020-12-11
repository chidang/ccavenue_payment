module Ccavenue
  class Crypto
    attr_reader :working_key

    INIT_VECTOR = (0..15).to_a.pack("C*")

    def initialize(working_key:)
      @working_key = working_key
    end

    def encrypt(plain_text)
      secret_key =  [Digest::MD5.hexdigest(working_key)].pack("H*")
      cipher = OpenSSL::Cipher::Cipher.new('aes-128-cbc')
      cipher.encrypt
      cipher.key = secret_key
      cipher.iv  = INIT_VECTOR
      encrypted_text = cipher.update(plain_text) + cipher.final
      (encrypted_text.unpack("H*")).first
    end

    def decrypt(cipher_text)
      secret_key =  [Digest::MD5.hexdigest(working_key)].pack("H*")
      encrypted_text = [cipher_text].pack("H*")
      decipher = OpenSSL::Cipher::Cipher.new('aes-128-cbc')
      decipher.decrypt
      decipher.key = secret_key
      decipher.iv  = INIT_VECTOR
      (decipher.update(encrypted_text) + decipher.final).gsub(/\0+$/, '')
    end
  end
end
