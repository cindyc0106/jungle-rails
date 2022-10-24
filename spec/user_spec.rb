require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    # validation examples here

    it "saves successfully when all fields are valid" do
      @user = User.new(first_name: "cindy", last_name: "chen", email:)

    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end

end
