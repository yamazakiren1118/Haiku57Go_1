class Haiku < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :favorites
  has_many :users,through: :favorites
  validates :haiku1,presence: true
  validates :haiku2,presence: true
  validates :haiku3,presence: true
end
