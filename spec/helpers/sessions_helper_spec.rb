require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do
  let(:user) { create(:user) }
  describe "#login_in" do
    it "creates a session" do
      expect(session[:user_id]).to eq(nil)
      log_in(user)
      expect(session[:user_id]).to eq(user.id)
    end
  end

  describe "#current_user" do
    it "returns the user set in the session" do
      log_in(user)
      expect(current_user).to eq(user)
    end
  end

  describe "#logged_out?" do
    it "deletes session" do
      log_in(user)
      expect(session[:user_id]).not_to be nil
      log_out
      expect(session[:user_id]).to be nil
    end
  end
end
