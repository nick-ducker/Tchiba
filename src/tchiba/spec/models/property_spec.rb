require 'rails_helper'

RSpec.describe Property, type: :model do
  
  before(:all) do
    @property = build(:property)
  end

  it "should be valid with valid attributes" do
    expect(@property).to be_valid
  end

  it "should not be valid without a name" do
    @property.name = nil
    expect(@property).to_not be_valid
  end

  it "should not be valid without a description" do
    @property.descrip = nil
    expect(@property).to_not be_valid
  end

  it { should have_and_belong_to_many(:blends) }

end
