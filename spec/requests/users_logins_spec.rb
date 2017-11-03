require 'rails_helper'

RSpec.describe "UsersLogins", type: :request do
  describe "Admin Users" do
    let(:admin) { create(:admin) }
    describe "Successful Login" do
      before do
        get login_path
        stub_box_items_request
      end

      it "redirects to the uploads path" do
        post login_path, params: { session: { email: admin.email, password: admin.password } }
        expect(response).to redirect_to(uploads_path)
      end
    end

    describe "Unsuccessful Login" do
      it "renders new" do
        post login_path, params: { session: { email: admin.email, password: "wrong" } }
        expect(response).to render_template(:new)
      end
    end
    describe "Successful logout" do
      it "successfully logs user out when clicked" do
        post login_path, params: { session: { email: admin.email, password: admin.password } }
        delete logout_path
        expect(response).to redirect_to login_path
      end
    end
  end
  describe "Not Logged in" do
    it "redirects when not logged in" do
      get uploads_path
      expect(response).to redirect_to(login_path)
    end
  end

end
