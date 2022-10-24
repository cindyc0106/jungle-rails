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

    it "does not validate successfully with missing name" do
      @category = Category.new
      @product = Product.new(name: nil, price: 25000, quantity: 5, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "does not validate successfully with missing price" do
      @category = Category.new
      @product = Product.new(name: "test", quantity: 5, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "does not validate successfully with missing quantity" do
      @category = Category.new
      @product = Product.new(name: "test", price: 25000, quantity: nil, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "does not validate successfully with missing category" do
      @category = Category.new
      @product = Product.new(name: "test", price: 25000, quantity: 5, category: nil)
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
  
end
