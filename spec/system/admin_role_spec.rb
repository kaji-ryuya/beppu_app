require 'rails_helper'

RSpec.describe 'AdminRole', type: :system do
  let!(:user) { create(:user)}
  let!(:admin) { create(:user, :admin) }
  let!(:spa) { create(:spa) }
  let!(:oniishi) { create(:spa, :oniishi)}

  describe '管理画面へのアクセス権限' do
    context '一般権限ユーザーの管理画面へのアクセス' do

      before do
        login_as(user)
      end

      it '管理画面へのアクセスが失敗する' do
        visit admin_root_path
        expect(current_path).to eq root_path
      end

      it 'ユーザー管理画面へのアクセスが失敗する' do
        visit admin_users_path
        expect(current_path).to eq root_path
      end

      it '温泉管理画面へのアクセスが失敗する' do
        visit admin_spas_path
        expect(current_path).to eq root_path
      end

      it 'ブックマーク管理画面へのアクセスが失敗する' do
        visit admin_bookmarks_path
        expect(current_path).to eq root_path
      end
    end
  end

  describe '温泉データの追加編集' do

    before do
      login_as(admin)
    end

    context '温泉データの追加' do

      before do
        visit new_admin_spa_path
      end

      it 'データの入力が正しい場合' do
        select 'outdoor_bath', from: '特徴'
        select 'ocean_view', from: 'ロケーション'
        select 'kannawa', from: '場所'
        select 'sulfur', from: '泉質'
        fill_in '温泉名', with: '仮温泉'
        click_button '登録する'
        spa1 = Spa.find_by(name: '仮温泉')

        expect(page).to have_content('温泉を作成しました。')
        expect(page).to have_content('仮温泉')
        expect(current_path).to eq admin_spa_path(spa1)
      end

      context '温泉のデータの追加に失敗する' do
        it '温泉名の入力が空欄の場合' do
          select 'outdoor_bath', from: '特徴'
          select 'ocean_view', from: 'ロケーション'
          select 'kannawa', from: '場所'
          select 'sulfur', from: '泉質'
          fill_in '温泉名', with: ''
          click_button '登録する'

          expect(page).to have_content('温泉名を入力してください')
          expect(current_path).to eq admin_spas_path
        end

        it '温泉名がすでに存在する場合' do
          select 'outdoor_bath', from: '特徴'
          select 'ocean_view', from: 'ロケーション'
          select 'kannawa', from: '場所'
          select 'sulfur', from: '泉質'
          fill_in '温泉名', with: '駅前高等温泉'
          click_button '登録する'

          expect(page).to have_content('温泉名はすでに存在します')
          expect(current_path).to eq admin_spas_path
        end
      end
    end

    context '温泉データの編集' do

      before do
        visit edit_admin_spa_path(spa)
      end

      it '入力が正しい場合' do
        fill_in '温泉名', with: '編集後温泉'
        click_button '更新する'

        expect(page).to have_content('温泉を更新しました。')
        expect(page).to have_content('編集後温泉')
        expect(current_path).to eq admin_spa_path(spa)
      end

      context '温泉データの編集に失敗する' do
        it '温泉名の入力が空欄のとき' do
          fill_in '温泉名', with: ''
          click_button '更新する'

          expect(page).to have_content('温泉名を入力してください')
          expect(current_path).to eq admin_spa_path(spa)
        end

        it '温泉名がすでに存在しているとき' do
          fill_in '温泉名', with: '鬼石の湯'
          click_button '更新する'

          expect(page).to have_content('温泉名はすでに存在します')
          expect(current_path).to eq admin_spa_path(spa)
        end
      end
    end
  end
end
