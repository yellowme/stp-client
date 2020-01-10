module STP
  module Structs
    class PaymentOrder
      attr_accessor :counterpart_institution,            # a  - Institución contraparte
                    :company,                            # b  - Empresa
                    :operation_date,                     # c  - Fecha de operación
                    :folio,                              # d  - Folio origen
                    :tracking_key,                       # e  - Clave de rastreo
                    :operant_institution,                # f  - Institución operante
                    :amount,                             # g  - Monto del pago
                    :payment_type,                       # h  - Tipo del pago
                    :payer_account_type,                 # i  - Tipo de la cuenta del ordenante
                    :payer_name,                         # j  - Nombre del ordenante
                    :payer_account,                      # k  - Cuenta del ordenante
                    :payer_rfc,                          # l  - RFC / Curp del ordenante
                    :beneficiary_account_type,           # m  - Tipo de cuenta del beneficiario
                    :beneficiary_name,                   # n  - Nombre del beneficiario
                    :beneficiary_account,                # o  - Cuenta del beneficiario
                    :beneficiary_rfc,                    # p  - RFC / Curp del beneficiario
                    :beneficiary_email,                  # q  - Email del beneficiario
                    :secondary_beneficiary_account_type, # r  - Tipo de cuenta del beneficiario 2
                    :secondary_beneficiary_name,         # s  - Nombre del beneficiario 2
                    :secondary_beneficiary_account,      # t  - Cuenta del beneficiario 2
                    :secondary_beneficiary_rfc,          # u  - RFC / Curp del beneficiario 2
                    :payment_concept,                    # v  - Concepto del pago
                    :payment_secondary_concept,          # w  - Conceptodelpago2
                    :user_catalog_key,                   # x  - Clave del catálogo de usuario 1
                    :secondary_user_catalog_key,         # y  - Clave del catálogo de usuario 2
                    :payment_key,                        # z  - Clave del pago
                    :collection_reference,               # aa - Referencia de cobranza
                    :number_reference,                   # bb - Referencia numérica
                    :operation_type,                     # cc - Tipo de operación
                    :topology,                           # dd - Topología
                    :user,                               # ee - Usuario
                    :delivery_method,                    # ff - Medio de entrega
                    :priority,                           # gg - Prioridad
                    :iva,                                # hh - IVA
                    :original_chain,
                    :signature

      def initialize
        @company = STP.company
      end

      def original_chain
        "||#{@counterpart_institution}|"\
          "#{@company}|"\
          "#{@operation_date}|"\
          "#{@folio}|"\
          "#{@tracking_key}|"\
          "#{@operant_institution}|"\
          "#{@amount.nil? ? '' : format('%.2f', @amount.to_f)}|"\
          "#{@payment_type}|"\
          "#{@payer_account_type}|"\
          "#{@payer_name}|"\
          "#{@payer_account}|"\
          "#{@payer_rfc}|"\
          "#{@beneficiary_account_type}|"\
          "#{@beneficiary_name}|"\
          "#{@beneficiary_account}|"\
          "#{@beneficiary_rfc}|"\
          "#{@beneficiary_email}|"\
          "#{@secondary_beneficiary_account_type}|"\
          "#{@secondary_beneficiary_name}|"\
          "#{@secondary_beneficiary_account}|"\
          "#{@secondary_beneficiary_rfc}|"\
          "#{@payment_concept}|"\
          "#{@payment_secondary_concept}|"\
          "#{@user_catalog_key}|"\
          "#{@secondary_user_catalog_key}|"\
          "#{@payment_key}|"\
          "#{@collection_reference}|"\
          "#{@number_reference}|"\
          "#{@operation_type}|"\
          "#{@topology}|"\
          "#{@user}|"\
          "#{@delivery_method}|"\
          "#{@priority}|"\
          "#{@iva.nil? ? '' : format('%.2f', @iva.to_f)}||"
      end

      def as_json(_options = {})
        {
          claveRastreo: @tracking_key,
          conceptoPago: @payment_concept,
          cuentaBeneficiario: @beneficiary_account,
          cuentaOrdenante: @payer_account,
          empresa: @company,
          fechaOperacion: @operation_date,
          firma: @signature,
          folioOrigen: @folio,
          institucionContraparte: @counterpart_institution,
          institucionOperante: @operant_institution,
          monto: @amount,
          nombreBeneficiario: @beneficiary_name,
          nombreOrdenante: @payer_name,
          referenciaNumerica: @number_reference,
          rfcCurpBeneficiario: @beneficiary_rfc,
          rfcCurpOrdenante: @payer_rfc,
          tipoCuentaBeneficiario: @beneficiary_account_type,
          tipoCuentaOrdenante: @payer_account_type,
          tipoPago: @payment_type,
        }.compact
      end

      def to_json(*options)
        as_json(*options).to_json(*options)
      end
    end
  end
end
