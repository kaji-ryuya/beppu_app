require 'rails_helper'

RSpec.describe 'AdminRole', type: :system do
  let!(:spa) { create(:spa) }
  let!(:oniishi) { create(:spa, :oniishi)}

  before do
    visit question_path
  end

  describe '質問から探すで温泉が探せる' do
    context '貸切湯から探す' do
      it '貸切から泉質' do
        click_link '貸切湯'
        choose '緑の中'
        click_button '次へ'
        click_link '泉質'

        find('label[for="chloride"]').click
        click_button '次へ'

        expect(page).to have_content('鬼石の湯')
        expect(page).not_to have_content('駅前高等温泉')
      end

      it '貸切湯から別府八湯' do
        click_link '貸切湯'
        choose '緑の中'
        click_button '次へ'
        click_link '別府八湯'
        find('label[for="kannawa"]').click
        click_button '次へ'

        expect(page).to have_content('鬼石の湯')
        expect(page).not_to have_content('駅前高等温泉')
      end

      it '貸切湯からそのままおすすめへ' do
        click_link '貸切湯'
        choose '緑の中'
        click_button '次へ'
        click_link '特に気にしない'

        expect(page).to have_content('鬼石の湯')
        expect(page).not_to have_content('駅前高等温泉')
      end
    end

    describe '貸切湯以外から探す' do
      context '泉質から探す' do 
        it 'おすすめの温泉が表示される' do
          click_link '貸切湯以外'
          click_link '泉質'
          find('label[for="simple"]').click
          click_button '次へ'

          expect(page).not_to have_content('露天風呂')
          choose 'ジモ泉(地元に根付いている温泉)'
          click_button '次へ'

          expect(page).to have_content('駅前高等温泉')
          expect(page).not_to have_content('鬼石の湯')
        end
      end

      context '温泉の特徴から探す' do
        it 'おすすめの温泉が表示される' do
          click_link '貸切湯以外'
          click_link '温泉の特徴'
          choose 'ジモ泉(地元に根付いている温泉)'
          click_button '次へ'

          expect(page).not_to have_selector('input[type="radio"][value="chloride"]')
          find('label[for="simple"]').click
          click_button '次へ'

          expect(page).to have_content('駅前高等温泉')
          expect(page).not_to have_content('鬼石の湯')
        end
      end
    end
  end
end