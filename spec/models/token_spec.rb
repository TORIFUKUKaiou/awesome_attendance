require 'rails_helper'

RSpec.describe Token, type: :model do
  subject { token }

  let(:token) { Token.create(label: "name", key: "secret") }

  describe 'validation' do
    describe 'label' do
      let(:attribute_name) { :label }

      it { is_expected.to validate_presence_of attribute_name }
    end

    describe 'key' do
      let(:attribute_name) { :key }

      it { is_expected.to validate_presence_of attribute_name }
    end
  end
end
