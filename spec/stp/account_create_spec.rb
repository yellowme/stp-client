require 'support/stp_test_helpers'

RSpec.describe STP::Account do
  subject do
    STP::Account.create(account_obj)
  end

  describe 'account create' do
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
          stub_request(:put, "#{STP.api_uri}/cuentaModule/fisica").to_return(
            body: JSON.dump(STPTestHelpers::ACCOUNT_CREATE_MOCK_SUCCESS()), status: 200
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
          stub_request(:put, "#{STP.api_uri}/cuentaModule/fisica").to_return(
            body: JSON.dump(STPTestHelpers::ACCOUNT_CREATE_MOCK_SUCCESS()), status: 200
          )
        end

        it { expect{subject}.not_to raise_error }
      end
    end

    context 'fails when' do
      context 'random error' do
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
          stub_request(:put, "#{STP.api_uri}/cuentaModule/fisica").to_return(
            body: JSON.dump(STPTestHelpers::ACCOUNT_CREATE_MOCK_ERROR(1)), status: 200
          )
        end

        it { expect {subject}.to raise_error(STP::Errors::STPError) }
      end

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
          stub_request(:put, "#{STP.api_uri}/cuentaModule/fisica").to_return(
            body: JSON.dump(STPTestHelpers::ACCOUNT_CREATE_MOCK_ERROR(1, 'Cuenta Duplicada')), status: 200
          )
        end

        it { expect {subject}.to raise_error(STP::Errors::AccountAlreadyExists) }
      end
    end
  end
end
