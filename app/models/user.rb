class User < ApplicationRecord
  has_secure_password
  has_many :haikus
  has_many :user_haikus, through: :haikus

  validates :name , presence:true,
  length: {maximum: 20}
  validates :email , presence:true,
  uniqueness: true,
  format: {with:/.+@.+\..+/,message:"エラーが起きました"}
  validates :password_digest , presence:true,
  uniqueness:true
end
