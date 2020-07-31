require 'rails_helper'

RSpec.describe Cart, type: :model do

  before(:all) do
    create(:user)
    @cart = build(:cart)
  end

  it "should be valid with valid attributes" do
    expect(@cart).to be_valid
  end

  it { should belong_to(:user) }

  it { should have_many(:cart_items) }

end
