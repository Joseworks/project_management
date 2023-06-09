# frozen_string_literal: true

# Address the ActionDispatch::Request::Session::DisabledSessionError
# (Your application has sessions disabled. To write to the
# session you must first configure a session store) error

# Reference: Open issue on the Devise-JWT repo https://github.com/waiting-for-dev/devise-jwt/issues/235

module RackSessionFix
  extend ActiveSupport::Concern
  class FakeRackSession < Hash
    def enabled?
      false
    end
  end
  included do
    before_action :set_fake_rack_session_for_devise

    private

    def set_fake_rack_session_for_devise
      request.env['rack.session'] ||= FakeRackSession.new
    end
  end
end
