require 'rails_helper'

RSpec.describe User, type: :model do

  before(:all) do
    @user = build(:user)
    build(:conversation)
    build(:order)
  end

  it "is valid with valid attributes" do 
    expect(@user).to be_valid
  end

  it "is valid without a name" do 
    @user.name = nil
    expect(@user).to be_valid
  end

  it "is valid without a bio" do
    @user.bio = nil
    expect(@user).to be_valid    
  end
  it "is not valid without an email" do
    @user.email = nil
    expect(@user).to_not be_valid
  end
  it "is not valid without a password" do
    @user.password = nil
    expect(@user).to_not be_valid
  end

  it "is not valid without credit" do
    @user.credit = nil
    expect(@user).to_not be_valid
  end

  it { should have_one(:address) }

  it { should have_many(:to_conversations).with_foreign_key('to_user_id') } 
  it { should have_many(:from_conversations).with_foreign_key('from_user_id') } 

  it { should have_many(:blends) }
  it { should have_many(:reviews) }

  it { should have_many(:buyer_orders).with_foreign_key('buyer_id') }
  it { should have_many(:seller_orders).with_foreign_key('seller_id') }

  it "has one attached image" do
    should respond_to(:profilepic)
  end

end
