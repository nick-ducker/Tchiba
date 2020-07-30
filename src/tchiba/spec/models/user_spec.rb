require 'rails_helper'

RSpec.describe User, type: :model do

  before(:all) do
    @user = build(:user)
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

  it { should have_many(:conversations) } 

  it { should have_many(:blends) }

  it { should have_many(:reviews) }

  it { should have_many(:orders) }

  it "has one attached image" do
    should respond_to(:profilepic)
  end

end
