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
      puts response.body if STP.verbose
      hash = JSON.parse(response.body)
      raise STP::Errors::AccountAlreadyExists.new(hash['id'], hash['descripcion']) if hash['id'] == 1 && hash['descripcion'] == 'Cuenta Duplicada'
      raise STP::Errors::STPError.new(hash['id'], hash['descripcion']) unless hash['id'] == 0
    end

    def self.delete(account)
      account.signature = Crypto::Commons.rsa_seal(STP.private_key, STP.private_key_password, account.original_chain)
      connection = Faraday.new(url: "#{STP.api_uri}/cuentaModule/fisica")
      response = connection.delete do |req|
        req.url ''
        req.headers['Content-Type'] = 'application/json'
        req.body = account.to_json
      end
      puts response.body if STP.verbose
      hash = JSON.parse(response.body)
      raise STP::Errors::STPError.new(hash['id'], hash['descripcion']) unless hash['id'] == 0
    end
  end
end
