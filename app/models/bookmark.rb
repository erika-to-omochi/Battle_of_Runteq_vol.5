class Bookmark < ApplicationRecord
  validates :user_id, uniqueness: { scope: :board_id }

  belongs_to :board
  belongs_to :user
end
