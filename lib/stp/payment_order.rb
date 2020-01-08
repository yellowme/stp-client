module STP
  module PaymentOrder
    def self.create(payment_order)
      payment_order.signature = Crypto::Commons.rsa_seal(STP.private_key, STP.private_key_password, payment_order.original_chain)
      connection = Faraday.new(url: "#{STP.api_uri}/ordenPago/registra")
      response = connection.put do |req|
        req.url ''
        req.headers['Content-Type'] = 'application/json'
        req.body = payment_order.to_json
      end
      hash = JSON.parse(response.body)
      hash['resultado']
    end
  end
end
