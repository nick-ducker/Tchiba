require 'rails_helper'

RSpec.describe Order, type: :model do

  before(:all) do
    user1 = create(:user)
    user2 = create(:user)
    create(:cart)
    create(:blend)
    create(:cart_item)
    @order = build(:order)
  end

  it "should be valid with valid attributes" do
    expect(@order).to be_valid
  end

  it "should not be valid without a gross amount" do
    @order.gross = nil
    expect(@order).to_not be_valid
  end

  it "Should not be valid without a total amount" do
    @order.total = nil
    expect(@order).to_not be_valid
  end

  it { should belong_to(:cart_item) }

  it { should belong_to(:buyer) }
  it { should belong_to(:seller) }

  it { should have_many(:transactions) }

end
