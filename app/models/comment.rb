class Comment < ApplicationRecord
    belongs_to :haiku
    belongs_to :user
end
