require 'rails_helper'

RSpec.describe Favorite, type: :system do

  before do
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

  describe 'いいねマーク' do
    context '記事にいいねをつけた場合' do
      it '1が表示される' do
        login
        visit article_path(@article2.id)
        click_on "いいね"
        expect(page).to have_content 1
      end
    end
  end
end