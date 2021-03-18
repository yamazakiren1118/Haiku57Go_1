class Haiku < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :favorites
  has_many :users,through: :favorites
  validates :haiku1,presence: true,length:{in: 4..7}
  validates :haiku2,presence: true,length:{in: 5..9}
  validates :haiku3,presence: true,length:{in: 4..7}
end
