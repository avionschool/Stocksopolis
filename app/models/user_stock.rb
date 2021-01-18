class UserStock < ApplicationRecord
    belongs_to :users, optional: true
  
end
