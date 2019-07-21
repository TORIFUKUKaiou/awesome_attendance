require 'rails_helper'

RSpec.describe User, type: :model do
  subject { user }

  let(:user) { FactoryBot.build(:user) }

  describe 'association' do
    describe 'org' do
      let(:attribute_name) { :org }

      it { is_expected.to belong_to(attribute_name) }
    end

    describe 'attendances' do
      let(:attribute_name) { :attendances }

      it { is_expected.to have_many(attribute_name) }
    end
  end

  describe 'validation' do
    describe 'email' do
      let(:attribute_name) { :email }

      it { is_expected.to validate_presence_of attribute_name }
      it { is_expected.to validate_uniqueness_of(attribute_name).case_insensitive }
      it { is_expected.to validate_length_of(attribute_name).is_at_most(255) }
    end

    describe 'name' do
      let(:attribute_name) { :name }

      it { is_expected.to validate_presence_of attribute_name }
    end

    describe 'code' do
      let(:attribute_name) { :code }

      it { is_expected.to validate_presence_of attribute_name }
      it { is_expected.to validate_uniqueness_of(attribute_name) }
    end

    describe 'password' do
      let(:user) { FactoryBot.build(:password_nil_user) }
      let(:attribute_name) { :password }

      it { is_expected.to validate_presence_of attribute_name }
      it { is_expected.to validate_length_of(attribute_name).is_at_least(6) }
    end
  end
end
