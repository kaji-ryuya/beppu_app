FactoryBot.define do
  factory :spa do
    name { '駅前高等温泉' }
    spring_quality { :simple }
    place { :beppu }
    have_family_bath { 'FALSE' }
    location { :in_town }
    charactor { :local_spa }
    lat { 33.27906 }
    lng { 131.50202 }
    place_id { 'ChIJEc7DTd2mRjURSLsUPIKJXTU' }
    photo_no { 0 }
    opening_time { 8 }
    closing_time { 23 }

    # lat, lng, place_idは湯都ピアのもの
    trait :chloride do
      name { '塩化物泉' }
      spring_quality { :chloride }
      lat { 33.26984 }
      lng { 131.50837 }
      place_id { 'ChIJ__9v-samRjURcU6qOAW32Co' }
    end

    trait :hamawaki do
      name { '浜脇泉' }
      place { :hamawaki }
      lat { 33.26984 }
      lng { 131.50837 }
      place_id { 'ChIJ__9v-samRjURcU6qOAW32Co' }
    end

    trait :have_family_bath do
      name { '貸切あり泉' }
      have_family_bath { 'TRUE' }
      lat { 33.26984 }
      lng { 131.50837 }
      place_id { 'ChIJ__9v-samRjURcU6qOAW32Co' }
    end

    trait :outdoor_bath do
      name { '露天泉' }
      charactor { :outdoor_bath }
      lat { 33.26984 }
      lng { 131.50837 }
      place_id { 'ChIJ__9v-samRjURcU6qOAW32Co' }
    end

    trait :ocean_view do
      name { 'オーシャンビュー泉' }
      location { :ocean_view }
      lat { 33.26984 }
      lng { 131.50837 }
      place_id { 'ChIJ__9v-samRjURcU6qOAW32Co' }
    end

    trait :oniishi do
      name { '鬼石の湯' }
      spring_quality { :chloride }
      place { :kannawa }
      have_family_bath { 'TRUE' }
      location { :in_nature }
      charactor { :outdoor_bath }
      lat { 33.3152 }
      lng { 131.46873 }
      place_id { "ChIJ5dWIg7unRjURf7_FKlIhTOw" }
      photo_no { 4 }
      opening_time { 10 }
      closing_time { 21 }
    end
  end
end
