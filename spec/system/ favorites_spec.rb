require 'rails_helper'

RSpec.describe 'いいね', type: :system do

  before do
    @user = FactoryBot.create(:user1)
    @user2 = FactoryBot.create(:user2)
    @article = FactoryBot.create(:article, user_id: @user.id)
    @article2 = FactoryBot.create(:article2, user_id: @user2.id)
  end

  describe 'いいねマーク' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: 'user1@gmail.com'
      fill_in 'user_password', with: '111111'
      click_button 'ログイン'  
      # first(".like-btn").click
    end
    context '記事にいいねをつけた場合' do
      it '1が表示される' do
        td_list = page.all('.align-middle')[5]
        expect(first('.heart').text).to have_content 1
      end
    end
  end
end