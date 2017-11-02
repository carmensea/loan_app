require 'rails_helper'

RSpec.describe "Users Signups", type: :feature do
  before do
    visit 'signup'
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
      expect(page).to have_content("Click to Download")
      stub_request(:get, "https://api.box.com/2.0/folders/0/items?limit=1000&offset=0").
        with(headers: {'Accept'=>'*/*', 'Authorization'=>'Bearer DmmSLJeVdzgLYzVR8ss50dZ1fXvKwiMS', 'Date'=>'Thu, 02 Nov 2017 04:24:59 GMT', 'User-Agent'=>'HTTPClient/1.0 (2.8.3, ruby 2.4.2 (2017-09-14))'}).should have_been_made
    end
  end
end
