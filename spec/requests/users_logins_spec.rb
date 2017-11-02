require 'rails_helper'

RSpec.describe "UsersLogins", type: :request do

  describe "Valid login" do
    before do
      @valid_user = create(:user)
      visit login_path
      stub_box_items_request
    end

    it "redirects to the correct template" do
      post login_path, params: { session: { email: @valid_user.email, password: @valid_user.password } }
      expect(response).to redirect_to(uploads_path)
    end

    it "redirects when not logged in" do
      get uploads_path
      expect(response).to redirect_to(login_url)
    end

    it "successfully logs user out when clicked" do
      post login_path, params: { session: { email: @valid_user.email, password: @valid_user.password } }
      delete logout_path
      expect(response).to redirect_to root_path
    end
  end
end
