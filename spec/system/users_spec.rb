require 'rails_helper'

RSpec.describe 'ユーザー管理機能', type: :system do
  before do
    @admin = FactoryBot.create(:admin)
    @user = FactoryBot.create(:user1)
    @user2 = FactoryBot.create(:user2)
  end
  def login
    visit new_user_registration_path
    fill_in 'user_name', with: @user.name
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'ログイン'
  end

  def admin_login
    visit new_user_registration_path
    fill_in 'user_name', with: 'test'
    fill_in 'user_email', with: 'test@dic.com'
    fill_in 'user_password', with: '111111'
    fill_in 'user_password_confirmation', with: '111111'
    click_button '新規登録'
  end

  def admin_login2
    visit new_user_session_path
    fill_in 'user_name', with: @admin.name
    fill_in 'user_email', with: @admin.email
    fill_in 'user_password', with: @admin.password
    click_button 'ログイン'
  end

  def login
    visit new_user_session_path
    fill_in 'user_name', with: @user.name
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'ログイン'
  end



  describe 'ユーザー登録機能' do
    context 'ユーザーを新規登録した場合' do
      it '登録完了の表示がされる' do
        admin_login
        expect(page).to have_content 'アカウント登録が完了しました。'
      end
      it 'リクエストボタンが表示される' do
        admin_login
        expect(page).to have_content 'テーマをリクエストする'
      end
    end
  end

  describe 'セッション機能' do
    context 'ユーザーがログインをした場合' do
      it 'ログインが表示がされる' do
        admin_login2
        expect(page).to have_content 'ログインしました。'
      end
    end
  end
  
  describe 'ログイン確認機能' do
    context 'ログイン後アカウント編集' do
      it '自身のプロフィールを編集することができる' do
        login
        visit articles_path
        click_link 'プロフィール'
        click_link 'プロフィール編集'
        fill_in 'user_name', with: 'テストさん'
        fill_in 'user_current_password', with: '111111'
        click_button '更新'
        expect(page).to have_content 'アカウント情報を変更しました。'
      end
      it 'ログインアウトを実行できる' do
        login
        visit articles_path
        click_link 'ログアウト'
        expect(page).to have_content 'ログアウトしました。'
      end
    end
    describe '管理画面のテスト' do
      context '管理ユーザは管理画面にアクセスできること' do
        it '管理ユーザは管理画面にアクセスできること' do
          admin_login2
          visit articles_path
          click_link 'プロフィール'
          click_link '管理者画面'
          expect(page).to have_content 'サイト管理'
        end
      end
    end
    context '一般ユーザは管理画面にアクセスできないこと' do
      it '一般ユーザは管理画面にアクセスできないこと' do
        login
        visit articles_path
        expect(page).not_to have_content '管理画面'
      end
    end

    describe 'ゲストログイン機能' do
      context '管理者ゲストログインをした場合' do
        it 'ゲストログインができる' do
          visit root_path
          click_link 'ゲストログイン'
          expect(page).to have_content 'ゲストユーザーとしてログインしました。'
        end
      end
    end
  end
end