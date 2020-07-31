require 'rails_helper'

RSpec.describe CartItem, type: :model do
  
  before(:all) do
    create(:user)
    create(:cart)
    create(:blend)
    @cart_item = build(:cart_item)
  end

  it "should be valid with valid attributes" do
    expect(@cart_item).to be_valid
  end

  it "should not be valid without a quanitity >= 1" do
    @cart_item.blend_quantity = -2
    expect(@cart_item).to_not be_valid
  end

  it { should belong_to(:cart) }
  it { should belong_to(:blend) }

end
