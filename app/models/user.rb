class User < ApplicationRecord
  has_secure_password
  has_many :haikus, dependent: :destroy
  has_many :favorites
  has_many :chat
  has_many :chat_comment
  has_many :favorite_haikus, through: :favorites,source: :haiku
  # has_many :haikus, dependent: :destroy

  validates :name , presence:true,
  length: {maximum: 20}
  validates :email , presence:true,
  uniqueness: true,
  format: {with:/.+@.+\..+/,message:"エラーが起きました"}
  validates :password_digest , presence:true,
  uniqueness:true
end
