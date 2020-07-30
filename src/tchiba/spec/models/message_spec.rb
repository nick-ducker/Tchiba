require 'rails_helper'

RSpec.describe Message, type: :model do
  
  before(:all) do 
    create(:user)
    create(:user)
    create(:blend)
    create(:conversation)
    @message = build(:message)
  end

  it "should be valid with valid attributes" do
    expect(@message).to be_valid
  end

  it "should not be valid without content" do
    @message.content = nil
    expect(@message).to_not be_valid
  end

  it { should belong_to(:conversation) }
  
end
