require 'rails_helper'

RSpec.describe Org, type: :model do
  subject { org }

  let(:org) { FactoryBot.build(:org) }

  describe 'validation' do
    describe 'name' do
      let(:attribute_name) { :name }

      it { is_expected.to validate_presence_of attribute_name }
      it { is_expected.to validate_uniqueness_of(attribute_name) }
    end
  end
end
