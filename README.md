# Ccavenue Payment

CCAvenue payment gem allows merchants to instantly collect payments from their users using various payment modes like credit cards, debit cards, cash cards, net banking etc.

## Bundler


```ruby
source 'https://rubygems.org'

gem 'rails'
gem 'figaro'
gem 'ccavenue_payment'
```

## Installation


Add this line to your application's Gemfile:

```ruby
    gem 'ccavenue_payment'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install ccavenue_payment

## Usage


CCAvenue test and production environments are separate.
Merchants need an active CCAvenue account to use the test environment and production environment. Merchants will have to log in to their CCAvenue M.A.R.S account and get the API credentials for using these environments.

All transactions initiated by the merchant on our test environment are not processed. Test environment is strictly for testing the request and response functions.

After successfully testing the integration, merchant can move to the production environment by changing the URL.

CCAvenue test URL is: https://test.ccavenue.com 

CCAvenue production URL is: https://secure.ccavenue.com

To test the integration login to your CCAvenue M.A.R.S account, under Settings tab -> API Keys page; copy the following credentials:
1. Merchant ID
2. Access Code
3. Working Key

For rails application, create a configuration file(config/application.yml):

```ruby
    CCAVENUE_MERCHANT_ID: "MERCHANT_ID"
    CCAVENUE_ACCESS_CODE: 'ACCESS_CODE'
    CCAVENUE_WORKING_KEY: 'C3B38A390A1A32DBE9F8FF4C4D59D662'
    CCAVENUE_MODE: 'live'
#CCAVENUE_MODE: 'test'
```

Main functions:

```ruby
    # encrypted hash data
    CcavenuePayment.encrypted_data(data)

    # decrypted response string
    CcavenuePayment.decrypted_data(params['encResponse']) 

    # Ccavenue request url
    CcavenuePayment.request_url
```

## Example Usage


Once you've configured CcavenuePayment, you need a checkout action; my action looks like:

```ruby
  def index
    data = {
        order_id: 'order-id-1',
        currency: 'INR',
        amount: 100,
        redirect_url: 'http://localhost:3000/payment_confirm',
        cancel_url: 'http://localhost:3000/payment_cancel'
    }
    @encRequest = CcavenuePayment.encrypted_data(data)
    @ccavenue_request_url = CcavenuePayment.request_url
    @ccavenue_access_code = ENV.fetch('CCAVENUE_ACCESS_CODE').freeze
  end
```

And my view looks like:

```ruby
  <form id="redirect" method="post" name="redirect" action="<%= @ccavenue_request_url %>">
    <input type="hidden" name="encRequest" value="<%= @encRequest %>">
    <input type="hidden" name="access_code" id="access_code" value="<%= @ccavenue_access_code %>">
    <button type="submit" class="btn btn-danger">Submit</button>
  </form>
```

Action confirmation looks like this:

```ruby
  def payment_confirm
    # parameter to response is encrypted reponse we get from CCavenue
    @data = 'null'
    if params['encResponse'].present?
      @data = CcavenuePayment.decrypted_data(params['encResponse']) 
      # Return parameters:
      #   Auth Description: <String: Payment Failed/Success>
      #   Checksum Verification <Bool: True/False>
      #   Response Data: <HASH/Array: Order_id, amount etc>
    end
  end
```

## Notes


All transactions initiated by the merchant on our test environment are not processed. Test environment is strictly for testing the request and response functions.

For testing ccavenue you have to mail your merchant id and register site to ccavenue help team and they will activate your account for test environment. mail account : service@ccavenue.com

You need provide thme the posting request URL for HDFC payment gateway. Example:

```sh
http://localhost:3000/ccavenue_bridge_pay
```

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
