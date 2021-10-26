require 'rails_helper'
RSpec.describe 'リクエスト投稿機能', type: :model do

  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:user1)
    end
    context 'タイトルが空の場合' do
      it 'バリデーションに引っかかる' do 
        request_themes = RequestTheme.new(name: 'テストリクエスト件名', title: nil, user_id: @user.id)
        expect(request_themes).not_to be_valid
      end
    end

    context '名前が空の場合' do
      it 'バリデーションに引っかかる' do
        request_themes = RequestTheme.new(name: nil, title: 'テストリクエスト本文', user_id: @user.id)
        expect(request_themes).not_to be_valid
      end
    end
    context 'すべて入力されている場合' do
      it '問題なく投稿できる' do
        request_themes = RequestTheme.new(title:'テストリクエスト本文', name: 'テストリクエスト件名', user_id: @user.id)
        expect(request_themes).to be_valid
      end
    end
  end
end