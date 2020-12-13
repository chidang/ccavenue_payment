require 'digest/md5'
require 'openssl'

RSpec.describe CcavenuePayment::Crypto do
  let(:subject) { described_class.new(working_key: '123456789') }
  let(:query_string) { 'a=1&b=2&c=3' }
  let(:cipher_text) { '8464d7293b058a134309275e1a8ff471' }

  describe '#encrypt' do
    it { expect(subject.encrypt(query_string)).to eq cipher_text }
  end

  describe '#decrypt' do
    it { expect(subject.decrypt(cipher_text)).to eq query_string }
  end
end
