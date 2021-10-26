require 'rails_helper'

RSpec.describe '記事機能', type: :system do
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

  describe '新規作成機能' do
    context '記事を新規作成した場合' do
      it '作成した記事が表示される' do
        admin_login
        visit new_article_path
        fill_in "article_title", with: "test_title"
        click_button '記事投稿'
        expect(page).to have_content 'test_title'
      end
    end
  end
  describe '一覧表示機能' do
    context '一覧画面に遷移した場合' do
      it '作成済みの記事一覧が表示される' do 
        login
        expect(page).to have_content 'test_title'
        expect(page).to have_content @article.title
      end
    end
    context '任意記事の詳細画面に遷移した場合' do
      it '該当タスクの内容が表示される' do
        visit article_path(@article)
        expect(page).to have_content 'test_title'
      end
    end
  end
  describe '記事編集機能' do
    context '記事の編集をした場合' do
      it '編集の内容が表示される' do
        admin_login
        all(".fa-edit")[0].click
        fill_in "article_title", with: "edit_title"
        click_button '記事投稿'
        expect(page).to have_content 'edit_title'
      end
    end
    context '他人の記事を編集をした場合' do
      it '他人の投稿は編集できない(編集ボタンが見つからない)' do 
        login
        visit articles_path
        # expect(page).not_to have_content find(".fa-edit")
        expect(page).not_to have_content all(".fa-edit")
      end
    end
    context '他人の記事を編集をした場合' do
      it '他人の投稿は削除できない（削除ボタンが見つからない）' do 
        login
        visit articles_path
        expect(page).not_to have_content all(".fa-trash-alt")
      end
    end
  end

  describe '記事削除機能' do
    context '記事を削除した場合' do      
      it '削除表示がされる' do
        admin_login
        page.accept_confirm do
          all(".fa-trash-alt")[0].click
        end
        expect(page).to have_content '削除'
      end
    end
  end

  describe '検索機能' do
    context '検索をした場合' do
      it "検索キーワードを含む記事で絞り込まれる" do
        login
        fill_in 'q[title_cont]', with: 'test'
        click_button '検索'
        expect(page).to have_content 'test'
      end
      it "検索キーワードを含まない記事は表示されない" do
        login
        fill_in 'q[title_cont]', with: 'test'
        click_button '検索'
        expect(page).not_to have_content 'article_a'
      end
    end
  end
end