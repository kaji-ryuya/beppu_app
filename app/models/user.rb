class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :bookmarks, dependent: :destroy
  has_many :bookmark_spas, through: :bookmarks, source: :spa

  validates :name, presence: true, length: { maximum: 255 }
  validates :email, uniqueness: true, presence: true
  
  validates :password, length: { minimum: 4 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :reset_password_token, presence: true, uniqueness: true, allow_nil: true

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
