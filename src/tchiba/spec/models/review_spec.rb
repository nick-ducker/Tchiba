require 'rails_helper'

RSpec.describe Review, type: :model do
  
  before(:all) do
    create(:user)
    create(:blend)
    @review = build(:review)
  end

  it "should be valid with valid attributes" do
    expect(@review).to be_valid
  end

  it "should not be valid without a rating" do
    @review.rating = nil
    expect(@review).to_not be_valid
  end

  it "should not have a rating more than 5" do
    @review.rating = 6.00
    expect(@review).to_not be_valid
  end

  it "should not have a rating that is an integer or float" do
    @review.rating = "button"
    expect(@review).to_not be_valid
  end

  it "should not be valid without a description" do
    @review.descrip = nil
    expect(@review).to_not be_valid
  end

  it { should belong_to(:blend) }
  it { should belong_to(:user) }

end
