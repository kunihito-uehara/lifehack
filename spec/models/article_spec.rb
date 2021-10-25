require 'rails_helper'
RSpec.describe '記事投稿機能', type: :model do

  describe 'バリデーションのテスト' do
    before do
      @user = FactoryBot.create(:admin)
    end
    context 'タイトルが空の場合' do
      it 'バリデーションに引っかかる' do
        article = Article.new(title: '')
        expect(article).not_to be_valid
      end
    end
  end
end