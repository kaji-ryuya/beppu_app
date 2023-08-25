class Spa < ApplicationRecord
  acts_as_taggable_on :tags
  has_many :bookmarks, dependent: :destroy

  enum spring_quality: { simple: 0, chloride: 1, bicarbonate: 2, sulfur: 3, sulfate: 4, acid: 5, iron_containing: 6 }
  enum place: { beppu: 0, hamawaki: 1, kamegawa: 2, kannawa: 3, kankaiji: 4, horita: 5, sibaseki: 6, myoban: 7, other: 8 }
  enum location: { in_town: 0, ocean_view: 1, in_nature: 2 }
  enum charactor: { outdoor_bath: 0, sauna: 1, unique_bath: 2, main_bath: 3, local_spa: 4, family_bath: 5, foot_bath: 6 }

  validates :name, presence: true, uniqueness: true
  validates :spring_quality, presence: true
  validates :place, presence: true
  validates :location, presence: true
  validates :charactor, presence:true
  validates :have_family_bath, inclusion: [true, false]

  scope :choiced_spring_quality, -> { where(spring_quality: session[:spring_quality]) }

  # ransack検索
  def self.ransackable_attributes(auth_object = nil)
    %w[charactor have_family_bath is_child_bathing location name place spring_quality opening_time closing_time]
  end
end
