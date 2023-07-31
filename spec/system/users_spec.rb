require 'rails_helper'

RSpec.describe 'Users', type: :system do
  let!(:user) { create(:user) }

  describe 'ログイン前' do
    context 'ユーザーの新規登録' do
      context 'フォームの入力値が正常' do
        it 'ユーザーの新規作成が成功する' do
          visit new_user_path
          fill_in 'ニックネーム', with: 'user'
          fill_in 'メールアドレス', with: 'email@example.com'
          fill_in 'パスワード', with: 'password'
          fill_in 'パスワード確認', with: 'password'
          click_button '登録'
          expect(page).to have_content 'ユーザー登録が完了しました。'
          expect(current_path).to eq login_path
        end
      end

      context 'メールアドレスが未入力' do
        it 'ユーザーの新規作成が失敗する' do
          visit new_user_path
          fill_in 'ニックネーム', with: 'user'
          fill_in 'メールアドレス', with: ''
          fill_in 'パスワード', with: 'password'
          fill_in 'パスワード確認', with: 'password'
          click_button '登録'
          expect(page).to have_content 'ユーザー登録に失敗しました。'
          expect(page).to have_content "メールアドレスを入力してください"
          expect(page).to have_field 'ニックネーム', with: 'user'
          expect(current_path).to eq users_path
        end
      end

      context '登録済のメールアドレスを使用' do
        it 'ユーザーの新規作成が失敗する' do
          existed_user = create(:user)
          visit new_user_path
          fill_in 'ニックネーム', with: 'user'
          fill_in 'メールアドレス', with: existed_user.email
          fill_in 'パスワード', with: 'password'
          fill_in 'パスワード確認', with: 'password'
          click_button '登録'
          expect(page).to have_content 'ユーザー登録に失敗しました。'
          expect(page).to have_content 'メールアドレスはすでに存在します'
          expect(current_path).to eq users_path
          expect(page).to have_field 'ニックネーム', with: 'user'
          expect(page).to have_field 'メールアドレス', with: existed_user.email
        end
      end
    end

    describe 'プロフィール編集画面' do
      context 'ログインしていない状態' do
        it 'アクセスが失敗する' do
          visit edit_profile_path
          expect(page).to have_content('ログインしてください。')
          expect(current_path).to eq login_path
        end
      end
    end
  end

  describe 'ログイン後' do
    before { login_as(user) }

    describe 'ユーザー編集' do
      context 'フォームの入力値が正常' do
        it 'ユーザーの編集が成功する' do
          visit edit_profile_path
          fill_in 'メールアドレス', with: 'update@example.com'
          fill_in 'ニックネーム', with: 'update_user'
          click_button '変更する'
          expect(page).to have_content('プロフィールを変更しました。')
          expect(current_path).to eq root_path
        end
      end

      context 'メールアドレスが未入力' do
        it 'ユーザーの編集が失敗する' do
          visit edit_profile_path
          fill_in 'メールアドレス', with: ''
          fill_in 'ニックネーム', with: 'update_user'
          click_button '変更する'
          expect(page).to have_content('プロフィールの変更に失敗しました。')
          expect(page).to have_content("メールアドレスを入力してください")
          expect(current_path).to eq profile_path
        end
      end

      context 'ニックネームが未入力' do
        it 'ユーザーの編集が失敗する' do
          visit edit_profile_path
          fill_in 'メールアドレス', with: 'update@example.com'
          fill_in 'ニックネーム', with: ''
          click_button '変更する'
          expect(page).to have_content('プロフィールの変更に失敗しました。')
          expect(page).to have_content("ニックネームを入力してください")
          expect(current_path).to eq profile_path
        end
      end

      context '登録済のメールアドレスを使用' do
        it 'ユーザーの編集が失敗する' do
          visit edit_profile_path
          other_user = create(:user)
          fill_in 'メールアドレス', with: other_user.email
          fill_in 'ニックネーム', with: ''
          click_button '変更する'
          expect(page).to have_content('プロフィールの変更に失敗しました。')
          expect(page).to have_content('メールアドレスはすでに存在します')
          expect(current_path).to eq profile_path
        end
      end
    end

    describe 'ユーザーの退会' do
      fit 'ユーザーの退会が成功する' do
        visit unsubscribe_path
        accept_confirm('本当に退会しますか？') do
          click_link '退会する'
        end
        
        expect(page).to have_content('ユーザーを削除しました。')
        expect(current_path).to eq root_path
      end

    end
  end
end