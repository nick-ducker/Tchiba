require 'rails_helper'

RSpec.describe Blend, type: :model do
   
  before(:all) do
    create(:user)
    @blend = build(:blend)
  end

  it "Should be valid with valid attributes" do
    expect(@blend).to be_valid
  end

  it "Should not be valid without a name" do
    @blend.name = nil
    expect(@blend).to_not be_valid
  end

  it "Should not be valid without a price" do
    @blend.price = nil
    expect(@blend).to_not be_valid
  end

  it "Should not be valid without a quantity" do
    @blend.quantity = nil
    expect(@blend).to_not be_valid
  end

  it "Should not be valid without a description" do
    @blend.descrip = nil
    expect(@blend).to_not be_valid
  end

  it "Should not be valid without a weight" do
    @blend.weight = nil
    expect(@blend).to_not be_valid
  end

  it { should belong_to(:user) }

  it { should have_many(:conversations) }
  it { should have_and_belong_to_many(:properties) }
  
  it { should have_many(:reviews) }

  it { should have_many(:cart_items) }

  it "has many attached images" do
    should respond_to(:images)
  end

end
