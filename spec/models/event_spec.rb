require 'rails_helper'

RSpec.describe Event, type: :model do
  subject { event }

  let(:event) { FactoryBot.build(:event) }

  describe 'validation' do
    describe 'name' do
      let(:attribute_name) { :name }

      it { is_expected.to validate_presence_of attribute_name }
    end

    describe 'date' do
      let(:attribute_name) { :date }

      it { is_expected.to validate_presence_of attribute_name }
    end
  end
end
