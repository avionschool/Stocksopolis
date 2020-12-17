class Role < ApplicationRecord
  has_many :tasks, dependent: :destroy
end
