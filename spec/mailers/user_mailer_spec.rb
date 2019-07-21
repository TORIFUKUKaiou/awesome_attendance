require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'password_reset' do
    let(:user) { FactoryBot.build(:user, email: 'to@example.org') }
    let(:mail) { UserMailer.password_reset(user) }

    before { user.reset_token = 'token' }

    # rubocop:disable RSpec/MultipleExpectations
    it 'renders the headers' do
      expect(mail.subject).to eq('Password reset')
      expect(mail.to).to eq(['to@example.org'])
      expect(mail.from).to eq(['from@example.com'])
    end
    # rubocop:enable RSpec/MultipleExpectations
  end
end
