class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :spa

  validates :user_id, uniqueness: { scope: :spa_id }


  def bookmark(spa)
    bookmark_spas << spa
  end

  def unbookmark(spa)
    bookmark_spas.destroy(spa)
  end

  def bookmark?(spa)
    bookmark_spas.include?(spa)
  end
end
