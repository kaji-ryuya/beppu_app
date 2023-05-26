FactoryBot.define do
  factory :spa do
    name { 'オーソドックス泉' }
    spring_quality { :simple }
    place { :beppu }
    have_family_bath { 'TRUE' }
    location { :in_town }
    charactor { :outdoor_bath }

    trait :chloride do
      name { 'chroride泉' }
      spring_quality { :chloride }
    end

    trait :hamawaki do
      name { '浜脇泉' }
      place { :hamawaki }
    end

    trait :not_have_family_bath do
      name { '貸切なし泉' }
      have_family_bath { 'FALSE' }
    end

    trait :furousen do
      name { '不老泉' }
      spring_quality { :simple }
      place { :beppu }
      have_family_bath { 'FALSE' }
      location { :in_town }
      lat { 33.27705 }
      lng { 131.50045 }
      place_id { "ChIJgcExzemmRjURU0FPa2A-9Co" }
      photo_no { 6 }
    end
  end
end
