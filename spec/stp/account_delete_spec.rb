require 'support/stp_test_helpers'

RSpec.describe STP::Account do
  subject do
    response = STP::Account.delete(account_obj)
    response
  end

  describe 'account delete' do
    context 'works ok! ' do
      context 'with valid data' do
        let(:account_obj) do
          account = STP::Structs::Account.new
          account.account = '01010101'
          account.name = Faker::Name.first_name
          account.paternal_surname = Faker::Name.last_name
          account.maternal_surname = Faker::Name.last_name
          account.rfc = 'RFC'
          account.birthdate = Faker::Date.birthday(min_age: 6, max_age: 65)
          account.sex = 'male'
          account.state = 'Mérida'
          account.economic_activity = 'programador'
          account.street = Faker::Address.street_name
          account.exterior_number = Faker::Address.building_number
          account.interior_nunmber = Faker::Address.building_number
          account.neighborhood = Faker::Address.community
          account.municipality = Faker::Address.community
          account.zip_code = Faker::Number.number(digits: 5)
          account.country = 'México'
          account.email = Faker::Internet.email
          account.identification_id = 'id'
          account.phone = Faker::PhoneNumber.phone_number
          account
        end

        before do
          allow(STP::Account).to receive(:delete).
            and_return(STPTestHelpers::ACCOUNT_DELETE_MOCK_SUCCESS())
        end

        it do
          response = subject
          expect(response['id']).not_to be_nil
          expect(response['id']).to be 0
          expect(response['descripcionError']).to be_nil
        end
      end

      context 'with minimal data' do
        let(:account_obj) do
          account = STP::Structs::Account.new
          account.company = STP.company
          account.account = '846180000400000001'
          account.rfc = 'RFCURP'
          account
        end

        before do
          allow(STP::Account).to receive(:delete).
            and_return(STPTestHelpers::ACCOUNT_DELETE_MOCK_SUCCESS())
        end

        it do
          response = subject
          expect(response['id']).not_to be_nil
          expect(response['id']).to be 0
          expect(response['descripcionError']).to be_nil
        end
      end
    end

    context 'fails when' do
      context 'repeating account and rfcCurp' do
        let(:account_obj) do
          account = STP::Structs::Account.new
          account.account = '01010101'
          account.name = Faker::Name.first_name
          account.paternal_surname = Faker::Name.last_name
          account.maternal_surname = Faker::Name.last_name
          account.rfc = 'RFC'
          account.birthdate = Faker::Date.birthday(min_age: 6, max_age: 65)
          account.sex = 'male'
          account.state = 'Mérida'
          account.economic_activity = 'programador'
          account.street = Faker::Address.street_name
          account.exterior_number = Faker::Address.building_number
          account.interior_nunmber = Faker::Address.building_number
          account.neighborhood = Faker::Address.community
          account.municipality = Faker::Address.community
          account.zip_code = Faker::Number.number(digits: 5)
          account.country = 'México'
          account.email = Faker::Internet.email
          account.identification_id = 'id'
          account.phone = Faker::PhoneNumber.phone_number
          account
        end

        before do
          allow(STP::Account).to receive(:delete).
            and_return(STPTestHelpers::ACCOUNT_DELETE_MOCK_ERROR(-2))
        end

        it { expect(subject['id']).to eq -2 }
        it { expect(subject['descripcionError']).not_to be_nil }
      end
    end
  end
end
