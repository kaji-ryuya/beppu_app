require 'rails_helper'

RSpec.describe 'GoogleMapSpec', type: :system, js: true do
  let!(:spa) { create(:spa) }
  let!(:oniishi) { create(:spa, :oniishi) }

  context '一覧画面でのmapsAPIからの写真の取得、表示' do
    it '画像の表示が正常に行われる' do
      visit spas_path
      expect(page).to have_css("#photo-#{spa.id}")
      expect(page).to have_css("#photo-#{oniishi.id}")
    end
  end

  context '詳細画面でmapsAPIからの写真とmapの取得、表示' do
    before do
      visit spa_path(spa)
    end

    it '画像が正常に表示される' do
      expect(current_path).to eq spa_path(spa)
      expect(page).to have_css("#photo")
    end

    it 'mapが正常に表示される' do
      expect(page).to have_css('#map')
    end
  end
end