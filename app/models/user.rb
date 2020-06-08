class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  validates :cellphone, 
    presence: true,
    format: { with: /\A[0-9]{9}\z/ }
  
end
