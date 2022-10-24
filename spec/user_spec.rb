require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # validation examples here

    it "saves successfully when all fields are valid" do
      @user = User.new(first_name: "cindy", last_name: "chen", email:"test@test.com", password: "123456", password_confirmation: "123456")
      @user.save
      expect(@user).to be_valid
    end

    it "does not validate successfully if password and password_confirmation are not the same" do
      @user = User.new(first_name: "cindy", last_name: "chen", email:"test@test.com", password: "123456", password_confirmation: "654321")
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "does not validate successfully if password length is under 5 characters" do
      @user = User.new(first_name: "cindy", last_name: "chen", email:"test@test.com", password: "123", password_confirmation: "123")
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end

    it "does not validate successfully if password is missing" do
      @user = User.new(first_name: "cindy", last_name: "chen", email:"test@test.com", password: nil, password_confirmation: nil)
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "does not validate successfully if email is missing" do
      @user = User.new(first_name: "cindy", last_name: "chen", email: nil, password: "123456", password_confirmation: "123456")
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "does not validate successfully if first/last name is missing" do
      @user = User.new(first_name: nil, last_name: nil, email: "test@test.com", password: "123456", password_confirmation: "123456")
      @user.save
      expect(@user.errors.full_messages).to include("First name can't be blank", "Last name can't be blank")
    end

    it "does not validate successfully if email is not unique" do
      @user = User.new(first_name: "cindy", last_name: "chen", email:"test@test.com", password: "123456", password_confirmation: "123456")
      @user.save

      @user_two = User.new(first_name: "cindy", last_name: "chen", email:"test@test.com", password: "123456", password_confirmation: "123456")
      @user_two.save

      expect(@user_two.errors.full_messages).to include("Email has already been taken")
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it "saves successfully when all fields are valid" do
      user = User.new(first_name: "cindy", last_name: "chen", email:"test@test.com", password: "123456", password_confirmation: "123456")
      user.save
      @user = User.authenticate_with_credentials(user.email, "123456")
      expect(@user).not_to be(nil)
    end

    it "saves successfully with spaces in email" do
      user = User.new(first_name: "cindy", last_name: "chen", email:"test@test.com", password: "123456", password_confirmation: "123456")
      user.save
      @user = User.authenticate_with_credentials("   test@test.com   ", "123456")
      expect(@user).not_to be(nil)
    end

  end

end
