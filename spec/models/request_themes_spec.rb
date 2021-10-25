require 'rails_helper'
RSpec.describe '記事投稿機能', type: :model do

  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:user1)
    end
    context 'タイトルが空の場合' do
      it 'バリデーションに引っかかる' do
        request_themes = Request_Themes.new(title: '')
        expect(request_themes).not_to be_valid
      end
    end
    # context '名前が空の場合' do
    #   it 'バリデーションに引っかかる' do
    #     request_themes = Request_Themes.new(name: '')
    #     expect(request_themes).not_to be_valid
    #   end
    # end

  end
end