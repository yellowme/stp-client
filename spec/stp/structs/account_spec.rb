RSpec.describe STP::Structs::Account do
  describe 'original_chain works ok' do
    context 'with full attributes' do
      let(:rfc) { 'RFCCURP' }
      let(:account) { '20111111' }
      let(:company) { 'EMPRESA' }
      let(:original_chain) { "||#{company}|#{account}|#{rfc}||" }

      before do
        @account = STP::Structs::Account.new
        @account.company = company
        @account.account = account
        @account.rfc = rfc
      end

      subject do
        @account.original_chain
      end

      it { expect(subject).to eq original_chain }
    end
  end
end
