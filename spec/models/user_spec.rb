require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validation" do
    it "1. is not valid without name" do
      user = User.new
      user.save
      expect(user).to_not be_valid 	
      expect(user.errors).to be_present
      expect(user.errors.to_h.keys).to include(:name)
		end
    it "2. is not valid without role id" do
      user = User.new
      user.save
      expect(user).to_not be_valid 	
      expect(user.errors).to be_present
      expect(user.errors.to_h.keys).to include(:role_id)
		end
  end
end
