require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with email address " do
    user = User.new(email: "mogli@mogli.com", password: "foobar",
                   password_confirmation: "foobar")
    expect(user).to be_valid
  end

  it "is not valid without an email address" do
    user = User.new(password: "foobar", password_confirmation: "foobar")
    expect(user).to_not be_valid
  end

  it "is not valid with too long of an email address" do
    user = User.new(email: "M" * 244 + "@example.com", password: "foobar", password_confirmation: "foobar")
    expect(user).to_not be_valid
  end

  it "is not valid with invalid email" do
    user = User.new(email: "mog@@", password: "foobar", password_confirmation: "foobar")
    expect(user).to_not be_valid
  end

  it "is not valid with duplicate email" do
    user = User.create(email: "mog@mog.com", password: "foobar", password_confirmation: "foobar")
    faker = User.new(email: "mog@mog.com", password: "foobar", password_confirmation: "foobar")
    expect(faker).to_not be_valid
  end

  it "saves email downcase" do
    user = User.create(email: "MOG@MOGMAN.COM", password: "foobar", password_confirmation: "foobar")
    expect(user.email).to eq("mog@mogman.com")
  end

  it "should have a password, cannot be blank" do
    user = User.create(email: "MOG@MOGMAN.COM")
    expect(user).to_not be_valid
  end
end
