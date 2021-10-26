require 'rails_helper'
RSpec.describe 'コメント機能', type: :system do
  before do
    @admin = FactoryBot.create(:admin)
    @user = FactoryBot.create(:user1)
    @user2 = FactoryBot.create(:user2)
    @article = FactoryBot.create(:article, user_id: @user.id)
    @article2 = FactoryBot.create(:article2, user_id: @user2.id)
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

  describe 'コメント投稿機能' do
    context 'コメントを投稿した場合' do
      it '投稿したコメントが表示される' do
        admin_login
        visit article_path(@article.id)
        fill_in "comment_content", with: "テストコメント"
        click_button '投稿'
        expect(page).to have_content 'テストコメント'
      end
    end
    context 'コメントを削除した場合' do
      it 'コメントが削除され表示されなくなる' do
        login
        visit article_path(@article.id)
        fill_in "comment_content", with: "テストコメント"
        click_button '投稿'
          all(".fa-trash-alt")[0].click
        expect(page).not_to have_content 'テストコメント'
      end
    end
  end
end