class Bookmark < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :spa, counter_cache: true

  validates :user_id, uniqueness: { scope: :spa_id }

end
