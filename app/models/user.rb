class User < ApplicationRecord
  validates "name", presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :role
  has_many :transactions
  has_many :stocks

  before_create :set_status
  after_create :send_new_user_email
  
  def calc_total_balance(amount)
    self.balance = self.balance - amount
    self.save
  end       
  

  private
  def set_status
    if self.role.role_name == "broker"
      self.status = "pending"
    else
      self.status = "approved"
    end
  end

  def send_new_user_email
    UserMailer.with(user: self).welcome_email.deliver_now
  end

end
