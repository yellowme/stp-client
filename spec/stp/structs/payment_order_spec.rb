RSpec.describe STP::Structs::PaymentOrder do
  describe 'original_chain works ok' do
    context 'with given example attributes' do
      let(:original_chain) { '||40072|EMPRESA|20111111||RAS|90646|9999.99||||1234|||Beneficiario|5678||||||||||||REFCOB|7777||||||||' }

      before do
        @payment_order = STP::Structs::PaymentOrder.new
        @payment_order.counterpart_institution = '40072'
        @payment_order.company = 'EMPRESA'
        @payment_order.operation_date = '20111111'
        @payment_order.tracking_key = 'RAS'
        @payment_order.operant_institution = '90646'
        @payment_order.amount = '9999.99'
        @payment_order.payer_account = '1234'
        @payment_order.beneficiary_name = 'Beneficiario'
        @payment_order.beneficiary_account = '5678'
        @payment_order.collection_reference = 'REFCOB'
        @payment_order.number_reference = '7777'
      end

      subject do
        @payment_order.original_chain
      end

      it { expect(subject).to eq original_chain }
    end

    context 'with full attributes' do
      let(:original_chain) do
        '||40072|EMPRESA|20111111|123|RAS|90646|9999.99|payment_type|'\
        'payer_account_type|payer_name|1234|payer_rfc|beneficiary_account_type|Beneficiario|'\
        '5678|beneficiary_rfc|beneficiary_email|secondary_beneficiary_account_type|secondary_beneficiary_name|secondary_beneficiary_account'\
        '|secondary_beneficiary_rfc|payment_concept|payment_secondary_concept|user_catalog_key|secondary_user_catalog_key|payment_key|REFCOB|7777|'\
        'operation_type|topology|user|delivery_method|priority|12.00||'
      end

      before do
        @payment_order = STP::Structs::PaymentOrder.new
        @payment_order.counterpart_institution = '40072'
        @payment_order.company = 'EMPRESA'
        @payment_order.operation_date = '20111111'
        @payment_order.folio = '123'
        @payment_order.tracking_key = 'RAS'
        @payment_order.operant_institution = '90646'
        @payment_order.amount = '9999.99'
        @payment_order.payment_type = 'payment_type'
        @payment_order.payer_account_type = 'payer_account_type'
        @payment_order.payer_name = 'payer_name'
        @payment_order.payer_account = '1234'
        @payment_order.payer_rfc = 'payer_rfc'
        @payment_order.beneficiary_account_type = 'beneficiary_account_type'
        @payment_order.beneficiary_name = 'Beneficiario'
        @payment_order.beneficiary_account = '5678'
        @payment_order.beneficiary_rfc = 'beneficiary_rfc'
        @payment_order.beneficiary_email = 'beneficiary_email'
        @payment_order.secondary_beneficiary_account_type = 'secondary_beneficiary_account_type'
        @payment_order.secondary_beneficiary_name = 'secondary_beneficiary_name'
        @payment_order.secondary_beneficiary_account = 'secondary_beneficiary_account'
        @payment_order.secondary_beneficiary_rfc = 'secondary_beneficiary_rfc'
        @payment_order.payment_concept = 'payment_concept'
        @payment_order.payment_secondary_concept = 'payment_secondary_concept'
        @payment_order.user_catalog_key = 'user_catalog_key'
        @payment_order.secondary_user_catalog_key = 'secondary_user_catalog_key'
        @payment_order.payment_key = 'payment_key'
        @payment_order.collection_reference = 'REFCOB'
        @payment_order.number_reference = '7777'
        @payment_order.operation_type = 'operation_type'
        @payment_order.topology = 'topology'
        @payment_order.user = 'user'
        @payment_order.delivery_method = 'delivery_method'
        @payment_order.priority = 'priority'
        @payment_order.iva = '12'
      end

      subject do
        @payment_order.original_chain
      end

      it { expect(subject).to eq original_chain }
    end

    context 'with some attributes' do
      let(:original_chain) { '||846|XXXXXX|||123456789|90646|11.35|1|40|||||S.A. de C.V.|846180000000000016|||||||Prueba REST||||||123456||T||3||||' }

      before do
        @payment_order = STP::Structs::PaymentOrder.new
        @payment_order.counterpart_institution = '846'
        @payment_order.company = 'XXXXXX'
        @payment_order.tracking_key = '123456789'
        @payment_order.operant_institution = '90646'
        @payment_order.amount = '11.35'
        @payment_order.payment_type = '1'
        @payment_order.payer_account_type = '40'
        @payment_order.beneficiary_name = 'S.A. de C.V.'
        @payment_order.beneficiary_account = '846180000000000016'
        @payment_order.payment_concept = 'Prueba REST'
        @payment_order.number_reference = '123456'
        @payment_order.topology = 'T'
        @payment_order.delivery_method = '3'
      end

      subject do
        @payment_order.original_chain
      end

      it { expect(subject).to eq original_chain }
    end

    context 'example number 4' do
      let(:original_chain) { '||846|FINVE|||pruebaFinve000|90646|0.01|1|||||40|prueba|846180000000000016|ND||||||prueba||||||123456||||||||' }

      before do
        @payment_order = STP::Structs::PaymentOrder.new
        @payment_order.payment_concept = 'prueba'
        @payment_order.tracking_key = 'pruebaFinve000'
        @payment_order.company = 'FINVE'
        @payment_order.beneficiary_account = '846180000000000016'
        @payment_order.counterpart_institution = '846'
        @payment_order.operant_institution = '90646'
        @payment_order.amount = '0.01'
        @payment_order.beneficiary_name = 'prueba'
        @payment_order.number_reference = '123456'
        @payment_order.payment_type = '1'
        @payment_order.beneficiary_account_type = '40'
        @payment_order.beneficiary_rfc = 'ND'
      end

      subject do
        @payment_order.original_chain
      end

      it { expect(subject).to eq original_chain }
    end
  end
end
