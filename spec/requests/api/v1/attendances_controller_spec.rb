require 'rails_helper'

RSpec.describe Api::V1::AttendancesController, type: :request do
  describe 'POST /api/v1/attendances' do
    let(:params) do
      {
        attendance: { code: user.code, place_id: place.id }
      }
    end
    let(:place) { FactoryBot.create(:place) }
    let(:org) { FactoryBot.create(:org) }
    let(:user) { FactoryBot.create(:user, org: org) }
    let(:event) { FactoryBot.create(:event, place: place) }
    let(:token) { Token.create(label:"name", key:"secret") }
    let(:headers) { { 'Authorization' => "Bearer #{token.key}" } }
    before do
      event
    end

    context 'when success' do
      before { post api_v1_attendances_path(format: :json), params: params, headers: headers }

      it { expect(response.status).to eq 200 }
    end
  end
end
