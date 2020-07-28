require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject {
    described_class.new(id: 1,
                        email: "test@test.com",
                        password: "password")
  }

  it "is valid with valid attributes" do 
    expect(subject).to be_valid
  end

  it "is valid without a name" do 
    subject.name = nil
    expect(subject).to be_valid
  end

  it "is valid without a bio" do
    subject.bio = nil
    expect(subject).to be_valid    
  end
  it "is not valid without an email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end
  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without credit" do
    subject.credit = nil
    expect(subject).to_not be_valid
  end

  it { should have_one(:address) }

  it { should have_many(:conversations) } 

  it { should have_many(:blends) }

  it { should have_many(:reviews) }

  it { should have_many(:orders) }

end
