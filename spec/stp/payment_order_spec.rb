require 'support/stp_test_helpers'

RSpec.describe STP::PaymentOrder do
  subject do
    response = STP::PaymentOrder.create(payment_order_obj)
    response
  end

  describe 'create_payment_order' do
    context 'works ok! ' do
      context 'with valid data' do
        let(:withdrawal_id) { "3#{rand.to_s[2..3]}d#{rand.to_s[2..3]}c6-1d#{rand.to_s[2..3]}-40a6-afef-70d6b3a9336f" }
        let(:payment_order_obj) do
          payment_order = STP::Structs::PaymentOrder.new
          payment_order.payment_concept = 'prueba veinte'
          payment_order.tracking_key = "#{Time.now.strftime '%j%y'}#{withdrawal_id.tr('-', '')[0, 24]}"
          payment_order.company = 'FINVE'
          payment_order.beneficiary_account = '846180000000000016'
          payment_order.counterpart_institution = '846'
          payment_order.operant_institution = '90646'
          payment_order.amount = '10.01'
          payment_order.beneficiary_name = 'prueba'
          payment_order.number_reference = "#{Time.now.strftime '%y%m%d'}"
          payment_order.payment_type = '1'
          payment_order.beneficiary_account_type = '40'
          payment_order.beneficiary_rfc = 'ND'
          payment_order
        end

        before do
          allow(STP::PaymentOrder).to receive(:create).
            and_return(STPTestHelpers::MOCK_SUCCESS())
        end

        it do
          response = subject
          expect(response['id']).not_to be_nil
          expect(response['id']).not_to be '0'
          expect(response['descripcionError']).to be_nil
        end
      end

      context 'with valid data' do
        let(:withdrawal_id) { "3#{rand.to_s[2..3]}d#{rand.to_s[2..3]}c6-1d#{rand.to_s[2..3]}-40a6-afef-70d6b3a9336f" }
        let(:payment_order_obj) do
          payment_order = STP::Structs::PaymentOrder.new
          payment_order.payment_concept = 'prueba veinte'
          payment_order.tracking_key = "#{Time.now.strftime '%j%y'}#{withdrawal_id.tr('-', '')[0, 24]}"
          payment_order.company = STP.company
          payment_order.folio = withdrawal_id
          payment_order.beneficiary_account = '846180000400000001'
          payment_order.counterpart_institution = '846'
          payment_order.operant_institution = '90646'
          payment_order.amount = '10.01'
          payment_order.beneficiary_name = 'STP'
          payment_order.number_reference = "#{Time.now.strftime '%y%m%d'}"
          payment_order.payment_type = '1'
          payment_order.beneficiary_account_type = '40'
          payment_order.beneficiary_rfc = 'ND'
          payment_order
        end

        before do
          allow(STP::PaymentOrder).to receive(:create).
            and_return(STPTestHelpers::MOCK_SUCCESS())
        end

        it do
          response = subject
          expect(response['id']).not_to be_nil
          expect(response['id']).not_to be '0'
          expect(response['descripcionError']).to be_nil
        end
      end
    end

    context 'fails when' do
      context 'repeating tracking_key' do
        let(:payment_order_obj) do
          payment_order = STP::Structs::PaymentOrder.new
          payment_order.payment_concept = 'prueba veinte'
          payment_order.tracking_key = 'pruebaFinve002'
          payment_order.company = 'FINVE'
          payment_order.beneficiary_account = '846180000000000016'
          payment_order.counterpart_institution = '846'
          payment_order.operant_institution = '90646'
          payment_order.amount = '10.01'
          payment_order.beneficiary_name = 'prueba'
          payment_order.number_reference = '123456'
          payment_order.payment_type = '1'
          payment_order.beneficiary_account_type = '40'
          payment_order.beneficiary_rfc = 'ND'
          payment_order
        end

        before do
          allow(STP::PaymentOrder).to receive(:create).
            and_return(STPTestHelpers::MOCK_ERROR(-2))
        end

        it { expect(subject['id']).to eq -2 }
        it { expect(subject['descripcionError']).not_to be_nil }
      end
    end
  end
end
