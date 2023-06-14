# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  subject(:user) { create(:user) }

  context 'when validating' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  context 'with a valid user' do
    let(:token) { user.generate_jwt }
    let(:key) { Rails.application.secrets.secret_key_base }

    it 'generates a valid jwt token' do
      expect(JWT.decode(user.generate_jwt, key).last['alg']).to eq 'HS256'
    end

    it 'generates a jwt token that can be decoded' do
      expect { JWT.decode(token, key) }.not_to raise_error(JWT::DecodeError)
    end

    it 'has a default role' do
      expect(user.role.name).to eq 'employee'
    end
  end
end
