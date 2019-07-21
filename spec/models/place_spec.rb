require 'rails_helper'

RSpec.describe Place, type: :model do
  subject { place }

  let(:place) { FactoryBot.build(:place) }

  describe 'validation' do
    describe 'name' do
      let(:attribute_name) { :name }

      it { is_expected.to validate_presence_of attribute_name }
    end
  end
end
