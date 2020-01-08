module STP
  class << self
    def api_uri=(api_uri)
      @api_uri = api_uri
    end

    def api_uri
      @api_uri
    end

    def private_key=(private_key)
      @private_key = private_key
    end

    def private_key
      @private_key
    end

    def private_key_password=(private_key_password)
      @private_key_password = private_key_password
    end

    def private_key_password
      @private_key_password
    end

    def company=(company)
      @company = company
    end

    def company
      @company
    end
  end
end
