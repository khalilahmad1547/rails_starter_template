# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    describe 'should be valid when' do
      it '.first_name is provided' do
        user = build(:user)
        expect(user).to be_valid
      end
    end

    describe 'should not be valid when' do
      it '.first_name is empty' do
        user = build(:user, first_name: '')
        expect(user).to_not be_valid
      end

      it '.last_name is empty' do
        user = build(:user, last_name: '')
        expect(user).to_not be_valid
      end

      it '.email is empty' do
        user = build(:user, email: '')
        expect(user).to_not be_valid
      end

      it '.password is empty' do
        user = build(:user, password: '')
        expect(user).to_not be_valid
      end
    end
  end

  describe 'Assosiactions' do
    it { should have_one :user_role }
  end
end
