module STP
  module Account
    def self.create(account)
      account.signature = Crypto::Commons.rsa_seal(STP.private_key, STP.private_key_password, account.original_chain)
      connection = Faraday.new(url: "#{STP.api_uri}/cuentaModule/fisica")
      response = connection.put do |req|
        req.url ''
        req.headers['Content-Type'] = 'application/json'
        req.body = account.to_json
      end
      hash = JSON.parse(response.body)
      raise STP::STPError.new(hash['message']) unless hash['id'] == 0
    end

    def self.delete(account)
      account.signature = Crypto::Commons.rsa_seal(STP.private_key, STP.private_key_password, account.original_chain)
      connection = Faraday.new(url: "#{STP.api_uri}/cuentaModule/fisica")
      response = connection.delete do |req|
        req.url ''
        req.headers['Content-Type'] = 'application/json'
        req.body = account.to_json
      end
      hash = JSON.parse(response.body)
      raise STP::STPError.new(hash['message']) unless hash['id'] == 0
    end
  end
end
