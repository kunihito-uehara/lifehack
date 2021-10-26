require 'rails_helper'

RSpec.describe 'リクエスト機能', type: :system do
  before do
    @admin = FactoryBot.create(:admin)
    @user = FactoryBot.create(:user1)
    @user2 = FactoryBot.create(:user2)
  end

  def login
    visit new_user_session_path
    fill_in 'user_name', with: @user.name
    fill_in 'user_email', with: @user.email
    fill_in 'user_password', with: @user.password
    click_button 'ログイン'
  end

  def admin_login
    visit new_user_session_path
    fill_in 'user_name', with: @admin.name
    fill_in 'user_email', with: @admin.email
    fill_in 'user_password', with: @admin.password
    click_button 'ログイン'
  end


  describe '新規作成機能' do
    context 'リクエストを新規作成した場合' do
      it '作成した記事がrails-adminで一覧で表示される' do
        admin_login
        visit new_request_theme_path
        fill_in 'request_theme_name', with: 'テスト件名'
        fill_in 'request_theme_title', with: 'テスト本文'
        click_button 'リクエストする'
        sleep 5.0
        click_link 'プロフィール'
        click_link '管理者画面'
        link = all('a', text: 'Request theme')[0]
        link.click
        expect(page).to have_content 'テスト件名'
      end
    end
  end

  describe 'リクエスト編集機能' do
    context 'リクエスト編集をした場合' do
      it '編集の内容が表示される' do 
        admin_login
        visit new_request_theme_path
        fill_in 'request_theme_name', with: 'テスト件名'
        fill_in 'request_theme_title', with: 'テスト本文'
        click_button 'リクエストする'
        click_link 'リクエスト編集'
        fill_in 'request_theme_name', with: 'テスト件名編集'
        fill_in 'request_theme_title', with: 'テスト本文編集'
        click_button 'リクエストする'
        expect(page).to have_content 'テスト件名編集'
      end
    end
  end
end