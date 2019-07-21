require 'rails_helper'

RSpec.describe Attendance, type: :model do
  subject { attendance }

  let(:attendance) { FactoryBot.build(:attendance) }

  describe 'association' do
    describe 'user' do
      let(:attribute_name) { :user }

      it { is_expected.to belong_to(attribute_name) }
    end

    describe 'event' do
      let(:attribute_name) { :event }

      it { is_expected.to belong_to(attribute_name) }
    end
  end

  describe 'validation' do
    describe 'user' do
      let(:attribute_name) { :user }

      it { is_expected.to validate_uniqueness_of(attribute_name).scoped_to(:event_id) }
    end
  end
end
