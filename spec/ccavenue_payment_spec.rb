RSpec.describe CcavenuePayment do
  let(:encrypted_string) do
    '3a1a549d68f96d28d6860c6cc7217e259ca7a8f98a1c2125833b70ef44594cab7d381c6a99027348ba52c3d8e8ca7da673f7a414c88c306ee5b7a1518e01f6888390d84b46229130ab903bcee7d8880d'
  end

  before do
    allow(CcavenuePayment::Config).to receive(:merchant_id).and_return('merchant-123')
    allow(CcavenuePayment::Config).to receive(:working_key).and_return('abc123')
  end

  describe 'check version number' do
    it "has a version number" do
      expect(CcavenuePayment::VERSION).to eq "1.1.8"
    end
  end

  describe '#encrypted_data' do
    let(:data) do
      {
        order_id: 'order-1',
        currency: 'INR',
        amount: 100
      }
    end
    
    it do
      expect(CcavenuePayment.encrypted_data(data)).to eq(encrypted_string)
    end
  end

  describe '#decrypted_data' do
    let(:expected_query_string) do
      "order_id=order-1&currency=INR&amount=100&merchant_id=merchant-123"
    end

    it do
      expect(CcavenuePayment.decrypted_data(encrypted_string)).to eq(expected_query_string)
    end
  end

  describe '#request_url' do
    context 'when TEST MODE' do
      let(:test_mode_url) do
        "https://test.ccavenue.com/transaction/transaction.do?command=initiateTransaction"
      end

      before do
        allow(CcavenuePayment::Config).to receive(:mode).and_return('test')
      end

      it do
        expect(CcavenuePayment.request_url).to eq(test_mode_url)
      end
    end

    context 'when LIVE MODE' do
      let(:live_mode_url) do
        "https://secure.ccavenue.com/transaction/transaction.do?command=initiateTransaction"
      end

      before do
        allow(CcavenuePayment::Config).to receive(:mode).and_return('live')
      end

      it do
        expect(CcavenuePayment.request_url).to eq(live_mode_url)
      end
    end
  end

  describe '#access_code' do

  end
end
