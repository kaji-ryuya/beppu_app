class Spa < ApplicationRecord
  enum spring_quality: { simple: 0, chloride: 1, bicarbonate: 2, sulfur: 3, sulfate: 4, acid: 5, iron_containing: 6 }
  enum place: { beppu: 0, hamawaki: 1, kamegawa: 2, kannawa: 3, kankaiji: 4, horita: 5, sibaseki: 6, myoban: 7 }
  enum location: { in_town: 0, ocean_view: 1, in_nature: 2 }
  enum charactor: { outdoor_bath: 0, sauna: 1, unipue_bath: 2, main_bath: 3, local_spa: 4, family_bath: 5 }

  validates :name, presence: true, uniqueness: true
  validates :spring_quality, presence: true
  validates :place, presence: true
  validates :location, presence: true
  validates :charactor, presence:true
  validates :have_family_bath, inclusion: [true, false]

end
