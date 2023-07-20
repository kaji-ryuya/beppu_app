require 'rails_helper'

RSpec.describe 'SpaIndexRansack', type: :system do
  let!(:spa) { create(:spa) }
  let!(:oniishi) { create(:spa, :oniishi) }

  before do
    visit spas_path
  end

  describe '検索欄での検索' do
    it '温泉名で検索' do
      fill_in 'q[name_cont]', with: '駅前高等温泉'
      click_button '検索'

      expect(page).to have_content('駅前高等温泉')
      expect(page).not_to have_content('鬼石の湯')
    end

    it '泉質で検索' do
      select "単純温泉", from: "q_spring_quality_eq"
      click_button '検索'

      expect(page).to have_content('駅前高等温泉')
      expect(page).not_to have_content('鬼石の湯')
    end

    it '貸切湯の有無で検索' do
      select "貸切湯なし", from: "q_have_family_bath_eq"
      click_button '検索'

      expect(page).to have_content('駅前高等温泉')
      expect(page).not_to have_content('鬼石の湯')
    end

    it '別府八湯で検索' do
      select "別府", from: "q_place_eq"
      click_button '検索'

      expect(page).to have_content('駅前高等温泉')
      expect(page).not_to have_content('鬼石の湯')
    end

    it '来店時間で検索' do
      select "22:00", from: "q_opening_time_lteq"
      click_button '検索'

      expect(page).to have_content('駅前高等温泉')
      expect(page).not_to have_content('鬼石の湯')
    end
    
    it 'すべての項目を入力して検索' do
      fill_in 'q[name_cont]', with: '駅前高等温泉'
      select "単純温泉", from: "q_spring_quality_eq"
      select "貸切湯なし", from: "q_have_family_bath_eq"
      select "別府", from: "q_place_eq"
      select "22:00", from: "q_opening_time_lteq"
      click_button '検索'

      expect(page).to have_content('駅前高等温泉')
      expect(page).not_to have_content('鬼石の湯')
    end
  end

  describe '検索結果に該当がなし' do
    it '該当なし' do
      fill_in 'q[name_cont]', with: '該当なし泉'
      click_button '検索'

      expect(page).to have_content('条件に合う温泉がありません。')
    end
  end

end
