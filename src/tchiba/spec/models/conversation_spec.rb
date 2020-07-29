require 'rails_helper'

RSpec.describe Conversation, type: :model do

  before(:all) do
    @user1 = create(:user)
    @user2 = create(:user)
    #@blend = build(:blend)

    @conversation = build(:conversation)
  end
  
  it "is valid with valid attributes" do
    expect(@conversation).to be_valid
  end

  it { should belong_to(:to_user) }
  it { should belong_to(:from_user) }

  it { should belong_to(:blend) }

end
