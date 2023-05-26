require 'rails_helper'

RSpec.describe Spa, type: :model do
  describe 'validation' do
    it 'validation すべて無効' do
      spa = build(:spa)
      expect(spa).to be_valid
      expect(spa.errors).to be_empty
    end

    it '温泉名なし' do
      spa_without_name = build(:spa, name: "")
      expect(spa_without_name).to be_invalid
      expect(spa_without_name.errors[:name]).to eq ["を入力してください"]
    end

    it '泉質なし' do
      spa_without_spring_quality = build(:spa, spring_quality: nil)
      expect(spa_without_spring_quality).to be_invalid
      expect(spa_without_spring_quality.errors[:spring_quality]).to eq ["を入力してください"]
    end

    it 'placeなし' do
      spa_without_place = build(:spa, place: nil)
      expect(spa_without_place).to be_invalid
      expect(spa_without_place.errors[:place]).to eq ["を入力してください"]
    end

    it 'have_family_bathなし' do
      spa_without_have_family_bath = build(:spa, have_family_bath: nil)
      expect(spa_without_have_family_bath).to be_invalid
      expect(spa_without_have_family_bath.errors[:have_family_bath]).to eq ["は一覧にありません"] # 訳がよくわからない
    end

    it 'locationなし' do
      spa_without_location = build(:spa, location: nil)
      expect(spa_without_location).to be_invalid
      expect(spa_without_location.errors[:location]).to eq ["を入力してください"]
    end

    it 'charactorなし' do
      spa_without_charactor = build(:spa, charactor: nil)
      expect(spa_without_charactor).to be_invalid
      expect(spa_without_charactor.errors[:charactor]).to eq ["を入力してください"]
    end

    it '温泉名の重複' do
      spa = create(:spa)
      spa_with_duplicated_name = build(:spa, name: spa.name)
      expect(spa_with_duplicated_name).to be_invalid
      expect(spa_with_duplicated_name.errors[:name]).to eq ["はすでに存在します"]
    end

    it '別の温泉名ならOK' do
      spa = create(:spa)
      spa_with_another_name = build(:spa, name: 'another_spa_name')
      expect(spa_with_another_name).to be_valid
      expect(spa_with_another_name.errors).to be_empty
    end
  end
end
