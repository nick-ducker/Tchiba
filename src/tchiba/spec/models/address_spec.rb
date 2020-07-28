require 'rails_helper'

RSpec.describe Address, type: :model do

  before(:all) do
    build(:user)
    @address = build(:address)
  end

  it "is valid with valid attributes" do 
    expect(@address).to be_valid
  end

  it "is not valid without a number that is an integer" do
    @address.number = nil
    expect(@address).to_not be_valid
  end

  it "is not valid without a street" do
    @address.street = nil
    expect(@address).to_not be_valid
  end

  it "is not valid without a suburb" do
    @address.suburb = nil
    expect(@address).to_not be_valid
  end

  it "is not valid without a state" do
    @address.state = nil
    expect(@address).to_not be_valid
  end

  it "is not valid without postcode that is an integer" do
    @address.postcode = nil
    expect(@address).to_not be_valid
  end

  it { should belong_to(:user).without_validating_presence }

end
