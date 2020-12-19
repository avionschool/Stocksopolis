require 'rails_helper'

RSpec.describe Role, type: :model do
  subject{
    described_class.new(role_name: "Broker")
  }

  it "1. is not valid with attributes" do
    expect(subject).to be_valid
  end
end
