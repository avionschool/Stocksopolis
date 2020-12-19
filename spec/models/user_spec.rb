require 'rails_helper'

RSpec.describe User, type: :model do
  subject{
    described_class.new(name: "Anna", role_id: 1, email: "anna123@gmail.com", password: "some_password")
  }

  it "1. is not valid without name" do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it "2. is not valid without email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without role id" do
    subject.role_id = nil
    expect(subject).to_not be_valid
  end

  
end
