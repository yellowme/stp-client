require 'crypto'
require 'faraday'

require 'stp/structs/account'
require 'stp/structs/payment_order'
require 'stp/account'
require 'stp/payment_order'
require 'stp/errors/stp_error'
require 'stp/errors/account_already_exists'

module STP
  def self.config
    yield self
  end

  def self.api_uri=(api_uri)
    @api_uri = api_uri
  end

  def self.api_uri
    @api_uri
  end

  def self.private_key=(private_key)
    @private_key = private_key
  end

  def self.private_key
    @private_key
  end

  def self.private_key_password=(private_key_password)
    @private_key_password = private_key_password
  end

  def self.private_key_password
    @private_key_password
  end

  def self.company=(company)
    @company = company
  end

  def self.company
    @company
  end

  def self.verbose
    @verbose
  end

  def self.verbose=(verbose)
    @verbose = verbose
  end
end
