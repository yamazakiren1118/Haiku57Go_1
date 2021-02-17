class Haiku < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :haiku1,presence: true
  validates :haiku2,presence: true
  validates :haiku3,presence: true
end
