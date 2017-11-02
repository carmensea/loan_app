require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    let(:admin) { create(:admin) }
    let(:user) { create(:user) }

    context "not logged in" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    context "logged in as admin" do
      it "redirects to uploads" do
        log_in(admin)
        get :new
        expect(response).to redirect_to uploads_path
      end
    end

    context "logged in as user" do
      it "redirects to login" do
        log_in(user)
        get :new
        expect(response).to redirect_to root_url
      end
    end

    context "logout" do
      it "redirects to login" do
        log_in(user)
        get :destroy
        expect(response).to redirect_to login_url
      end
    end
  end
end
