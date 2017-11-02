require 'rails_helper'

RSpec.describe "Users Signups", type: :request do
  describe "POST invalid signup" do
    before do
      get signup_path
      @invalid_user_params = { user: {email: "",
                                      password: "foor",
                                      password_confirmation: "bar" } }
    end

    it "doesn't change user count with wrong params" do
      expect { User.count }.not_to change {
        post signup_path, params: @invalid_user_params
        }
    end
  end

  describe "POST valid signup" do
    it "changes user count with correct params" do
      get signup_path
      expect { User.count }.to change {
        post users_path, params: { user: { email: "betty@gmail.com",
                                           password: "password123",
                                           password_confirmation: "password123" } }
        }
    end
  end
end
