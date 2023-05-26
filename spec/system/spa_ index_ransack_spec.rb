require 'rails_helper'

RSpec.describe 'SpaIndexRansack', type: :system, focus: true do
  let!(:orthodox) { create(:spa) }
  let!(:chloride) { create(:spa, :chloride) }
  let!(:hamawaki) { create(:spa, :hamawaki) }
  let!(:not_have_family_bath) { create(:spa, :not_have_family_bath) }
  let!(:furousen) { create(:spa, :furousen) }

  before do
    visit spas_path
  end

  describe '検索欄での検索' do
    it '温泉名で検索' do
      fill_in 'q[name_cont]', with: 'オーソドックス泉'
      find('#spa_search_submit').click

      expect(page).to have_content('オーソドックス泉')
      expect(page).not_to have_content('不老泉')
    end

    it '泉質で検索' do
      select "単純温泉", from: "select_spring_quality"
      find('#spa_search_submit').click

      expect(page).to have_content('オーソドックス泉')
      expect(page).not_to have_content(chloride.name)
    end

    it '貸切湯の有無で検索' do
      select "貸切湯あり", from: "select_have_family_bath"
      find('#spa_search_submit').click

      expect(page).to have_content('オーソドックス泉')
      expect(page).not_to have_content(not_have_family_bath.name)
    end

    it '別府八湯で検索' do
      select "別府", from: "select_place"
      find('#spa_search_submit').click

      expect(page).to have_content('オーソドックス泉')
      expect(page).not_to have_content(hamawaki.name)
    end
    
    it 'すべての項目を入力して検索' do
      fill_in 'q[name_cont]', with: 'オーソドックス泉'
      select "単純温泉", from: "select_spring_quality"
      select "貸切湯あり", from: "select_have_family_bath"
      select "別府", from: "select_place"
      find('#spa_search_submit').click

      expect(page).to have_content('オーソドックス泉')
      expect(page).not_to have_content('不老泉')
      expect(page).not_to have_content(chloride.name)
      expect(page).not_to have_content(not_have_family_bath.name)
      expect(page).not_to have_content(hamawaki.name)
    end
  end

  describe '検索結果に該当がなし' do
    it '該当なし' do
      fill_in 'q[name_cont]', with: '該当なし泉'
      find('#spa_search_submit').click

      expect(page).to have_content('条件に合う温泉がありません。')
    end
  end

end
