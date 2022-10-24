require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it "saves successfully with all four fields set" do
      @category = Category.new
      @product = Product.new(name: "test", price: 25000, quantity: 5, category: @category)
      @product.save
      expect(@product).to be_valid
    end

  end
end
