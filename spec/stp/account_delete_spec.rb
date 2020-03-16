require 'support/stp_test_helpers'

RSpec.describe STP::Account do
  subject do
    STP::Account.delete(account_obj)
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

        before do
          allow(STP::Account).to receive(:create).
            and_return(STPTestHelpers::ACCOUNT_DELETE_MOCK_SUCCESS())
        end
        
        before do
          stub_request(:delete, "#{STP.api_uri}/cuentaModule/fisica").to_return(
            body: JSON.dump(STPTestHelpers::ACCOUNT_DELETE_MOCK_SUCCESS()), status: 200
          )
        end

        it { expect{subject}.not_to raise_error }
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
          stub_request(:delete, "#{STP.api_uri}/cuentaModule/fisica").to_return(
            body: JSON.dump(STPTestHelpers::ACCOUNT_DELETE_MOCK_SUCCESS()), status: 200
          )
        end

        it { expect{subject}.not_to raise_error }
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
          stub_request(:delete, "#{STP.api_uri}/cuentaModule/fisica").to_return(
            body: JSON.dump(STPTestHelpers::ACCOUNT_DELETE_MOCK_ERROR(-2)), status: 200
          )
        end

        it { expect {subject}.to raise_error(STP::Errors::STPError) }
      end
    end
  end
end
