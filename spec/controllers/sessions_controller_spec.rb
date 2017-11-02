require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    context "not logged in" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end
    end

    context "logged in" do
      it "redirects to uploads" do

        get :new
        expect(response).to redirect_to uploads_path
      end
    end
  end
end
