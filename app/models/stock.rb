class Stock < ApplicationRecord
    belongs_to :users, optional: true
  
end
