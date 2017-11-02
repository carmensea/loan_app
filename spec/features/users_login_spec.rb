require 'rails_helper'

RSpec.describe "Users Logins", type: :feature do
  before do
    @sample_user = create(:user)
    visit 'login'
  end

  describe "Invalid Login" do
    it "fails to log the user in" do
      fill_in('Email', :with => '')
      fill_in('Password', :with => '')
      click_button('Log in')
      expect(page).to have_text('Invalid email/password combination Login Email Password BOA Login')
      visit root_path
      expect(page).to_not have_content('Invalid email/password combination Login Email Password BOA Login')
    end
  end

  describe "Valid Login" do
    it "correctly logs user in" do
      log_in_as_feature(@sample_user)
      expect(page).to have_current_path(uploads_path)
    end
  end
end
