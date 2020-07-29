require 'rails_helper'

RSpec.describe Transaction, type: :model do

  before(:all) do
    create(:user)
    create(:user)
    create(:order)
    @transaction = build(:transaction)
  end
  
  it "should be valid with valid attributes" do
    expect(@transaction).to be_valid
  end

  it "should not be valid without an amount" do
    @transaction.amount = nil
    expect(@transaction).to_not be_valid
  end

  it { should belong_to(:order) }

end
