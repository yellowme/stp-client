module STPTestHelpers
  def self.PAYMENT_ORDER_MOCK_ERROR(error_code)
    {
      'descripcionError' => 'regular error msg',
      'id' => error_code,
    }
  end

  def self.PAYMENT_ORDER_MOCK_SUCCESS
    {
      'id' => 5_840_086,
      'empresa' => 'FINVE',
      'folioOrigen' => '5840086',
      'estado' => 'Exito',
      'causaDevolucion' => '',
    }
  end

  def self.ACCOUNT_CREATE_MOCK_ERROR(error_code)
    {
      'descripcionError' => 'regular error msg',
      'id' => error_code,
    }
  end

  def self.ACCOUNT_CREATE_MOCK_SUCCESS
    {
      'id' => 0,
      'descripcion' => '',
    }
  end

  def self.ACCOUNT_DELETE_MOCK_ERROR(error_code)
    {
      'descripcionError' => 'regular error msg',
      'id' => error_code,
    }
  end

  def self.ACCOUNT_DELETE_MOCK_SUCCESS
    {
      'id' => 0,
      'descripcion' => '',
    }
  end
end
