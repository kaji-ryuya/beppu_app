class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :spa

  validates :user_id, uniqueness: { scope: :spa_id }

end
