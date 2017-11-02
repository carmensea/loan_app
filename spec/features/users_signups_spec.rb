require 'rails_helper'

RSpec.describe "Users Signups", type: :feature do
  before do
    visit 'signup'
    stub_box_items_request
  end
  describe "Invalid Signup" do
    it "has the correct error explanation" do
      fill_in('Email', :with => 'test@test.com')
      fill_in('Password', :with => 'foo')
      fill_in('Password confirmation', :with => 'bar')
      click_button('Create Account')
      expect(page).to have_css('div#error_explanation div.alert.alert-danger')
    end
  end

  describe "Valid Signup" do
    it "redirects to /uploads page" do
      fill_in('Email', :with => 'Betty@gmail.com')
      fill_in('Password', :with => 'Password123')
      fill_in('Password confirmation', :with => 'Password123')
      click_button('Create Account')
      expect(page).to have_content("Click to download")
    end
  end
end
