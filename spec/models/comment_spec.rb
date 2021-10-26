require 'rails_helper'
RSpec.describe 'コメント投稿機能', type: :model do
  describe 'バリデーションのテスト' do
    context 'コメント内容が空の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.create(:admin)
        article = FactoryBot.create(:article, user_id: user.id)
        comment = FactoryBot.build(:comment, content: nil, article_id: article.id, user_id: user.id)
        expect(comment).not_to be_valid
      end
    end

    context 'userが空の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.create(:admin)
        article = FactoryBot.create(:article, user_id: user.id)
        comment = FactoryBot.build(:comment, content: "test", article_id: article.id)
        expect(comment).not_to be_valid
      end
    end

    context 'articleが空の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.create(:admin)
        article = FactoryBot.create(:article, user_id: user.id)
        comment = FactoryBot.build(:comment, content: "test", user_id: user.id)
        expect(comment).not_to be_valid
      end
    end
    
    context 'articleとuserが空の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.create(:admin)
        article = FactoryBot.create(:article, user_id: user.id)
        comment = FactoryBot.build(:comment, content: "test")
        expect(comment).not_to be_valid
      end
    end

    context 'userとcontentが空の場合' do
      it 'バリデーションに引っかかる' do
        user = FactoryBot.create(:admin)
        article = FactoryBot.create(:article, user_id: user.id)
        comment = FactoryBot.build(:comment, content: nil, article_id: article.id, user_id: nil)
        expect(comment).not_to be_valid
      end
    end

    context 'コメント内容が空でない場合' do
      it 'バリデーションに引っかからない' do
        user = FactoryBot.create(:admin)
        article = FactoryBot.create(:article, user_id: user.id)
        comment = FactoryBot.build(:comment, content: 'コメント', article_id: article.id, user_id: user.id)
        expect(comment).to be_valid
      end
    end
  end
end