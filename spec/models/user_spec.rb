# frozen_string_literal: true

require 'rails_helper'

describe User, type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

  context 'with a valid user' do
    let(:user) { create(:user) }
    let(:token) { user.generate_jwt }
    let(:key) { Rails.application.secrets.secret_key_base }

    it 'generates a valid jwt token' do
      expect { JWT.decode(token, key) }.not_to raise_error(JWT::DecodeError)
    end
  end
end
