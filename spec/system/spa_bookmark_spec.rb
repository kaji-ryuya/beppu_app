require 'rails_helper'

RSpec.describe 'SpaBookmark', type: :system do
  let!(:spa) { create(:spa) }
  let!(:oniishi) { create(:spa, :oniishi) }
  let!(:admin) { create(:user, :admin) }

  before do
    visit spa_path(spa)
  end

  describe 'ログイン前' do
    it 'お気に入りボタンが出ていないこと' do
      expect(page).not_to have_content('お気に入り')
    end
  end

  describe 'ログイン後' do

    before do
      login_as(admin)
      visit spa_path(spa)
    end

    it 'お気に入り追加できる' do
      click_button 'お気に入り追加'

      expect(page).to have_content('お気に入り解除')
      expect(page).not_to have_content('お気に入り追加')
    end

    it 'お気に入り解除できる' do
      click_button 'お気に入り追加'
      expect(page).to have_content('お気に入り解除')
      expect(page).not_to have_content('お気に入り追加')
      
      click_button 'お気に入り解除'
      expect(page).to have_content('お気に入り追加')
      expect(page).not_to have_content('お気に入り解除')
    end

    fit 'お気に入り追加後にお気に入り一覧に追加される' do
      click_button 'お気に入り追加'
      expect(page).to have_content('お気に入り解除')
      expect(page).not_to have_content('お気に入り追加')

      visit bookmarks_spas_path
      expect(page).to have_content('駅前高等温泉')
      expect(page).to have_content('お気に入り解除')
      expect(page).not_to have_content('鬼石の湯')
    end
  end

end
