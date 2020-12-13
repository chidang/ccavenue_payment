require 'uri'

module CcavenuePayment
  # Create request object
  # === Options(Hash)
  def self.encrypted_data(data)
    #query_string = data.merge!({ merchant_id: Config.merchant_id }).to_query
    query_string = hash_to_query(data.merge!({ merchant_id: Config.merchant_id }))
    crypto.encrypt(query_string)
  end

  def self.decrypted_data(encrypted_string)
    crypto.decrypt(encrypted_string)
  end

  def self.request_url
    if Config.mode.upcase == 'TEST'
      "https://test.ccavenue.com/transaction/transaction.do?command=initiateTransaction"
    elsif Config.mode.upcase == 'LIVE'
      "https://secure.ccavenue.com/transaction/transaction.do?command=initiateTransaction"
    end
  end

  def self.access_code
    @access_code ||= Config.access_code
  end

  private

  def self.crypto
    @crypto ||= Crypto.new(working_key: Config.working_key)
  end

  def self.hash_to_query(hash)
    URI.encode(hash.map{|k,v| "#{k}=#{v}"}.join("&"))
  end
end
