require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it "is valid with email address " do
    expect(user).to be_valid
  end

  it "is not valid without an email address" do
    user.email = ""
    expect(user).to_not be_valid
  end

  it "is not valid with too long of an email address" do
    user.email = "M" * 244 + "@example.com"
    expect(user).to_not be_valid
  end

  it "is not valid with invalid email" do
    user.email = "mog@@"
    expect(user).to_not be_valid
  end

  it "is not valid with duplicate email" do
    mark = User.create(email: "mog@mog.com", password: "foobar", password_confirmation: "foobar")
    faker = User.new(email: "mog@mog.com", password: "foobar", password_confirmation: "foobar")
    expect(faker).to_not be_valid
  end

  it "saves email downcase" do
    user.email = "MOG@MOGMAN.COM"
    user.save
    expect(user.email).to eq("mog@mogman.com")
  end

  it "should have a password, cannot be blank" do
    user.password = ""
    user.password_confirmation = ""
    expect(user).to_not be_valid
  end
end
