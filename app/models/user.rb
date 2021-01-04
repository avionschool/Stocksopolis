class User < ApplicationRecord
  validates "name", presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role
  has_many :transactions
  has_many :stocks, through: :transactions


  def calc_total_balance(amount)
    self.balance = self.balance - amount
    self.save
end       
end
