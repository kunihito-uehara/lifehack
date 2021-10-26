require 'rails_helper'

RSpec.describe 'リクエスト機能', type: :system do
  before do
    
  end

  describe '新規作成機能' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: 'user1@gmail.com'
      fill_in 'user_password', with: '111111'
      click_button 'ログイン'  
      visit new_request_theme_path
      fill_in "request_theme_name", with: "test_name"
      fill_in "request_theme_title", with: "test_title"
      click_button '新規登録'
    end

    context 'リクエストを新規作成した場合' do
      it '作成した記事が表示される' do
        expect(page).to have_content 'test_title'管理画面で見るから表示されない予定
      end
    end
  end
  describe '一覧表示機能' do 一覧もでない
    before do
      visit new_user_session_path
      fill_in 'user_email', with: 'user1@gmail.com'
      fill_in 'user_password', with: '111111'
      click_button 'ログイン' 
      visit articles_path
    end
    context '一覧画面に遷移した場合' do
      it '作成済みの記事一覧が表示される' do 
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
    before do
      visit new_user_session_path
      fill_in 'user_email', with: 'admin@gmail.com'
      fill_in 'user_password', with: '111111'
      click_button 'ログイン'  
      visit articles_path
      # click_link "/articles/@article.id/edit"
      # find(".glyphicon-edit").click
    end
    context '記事の編集をした場合' do
      it '編集の内容が表示される' do 
        all(".glyphicon-edit")[0].click
        fill_in "article_title", with: "edit_title"
        click_button '更新する'
        expect(page).to have_content 'edit_title'
      end
    end
    context '他人の記事を編集をした場合' do
      it '他人の投稿は編集できない' do 
        expect(page).to_not have_content find(".glyphicon-edit")
      end
    end
    context '他人の記事を編集をした場合' do
      it '他人の投稿は削除できない' do 
        expect(page).to_not have_content find(".delete-icon")
      end
    end
  end

  describe '記事削除機能' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: 'user1@gmail.com'
      fill_in 'user_password', with: '111111'
      click_button 'ログイン'    
    end
    context '記事を削除した場合' do      
      it '削除表示がされる' do
        page.accept_confirm do
          all(".glyphicon-trash")[0].click
        end
        expect(page).to have_content '記事を削除しました'
      end
    end
  end

  describe '検索機能' do
    before do
      visit new_user_session_path
      fill_in 'user_email', with: 'user1@gmail.com'
      fill_in 'user_password', with: '111111'
      click_button 'ログイン' 
    end
    context '検索をした場合' do
      it "検索キーワードを含む記事で絞り込まれる" do
        fill_in 'search_title', with: 'test'
        click_button '検索'
        expect(page).to have_content 'test'
      end
      it "検索キーワードを含まない記事は表示されない" do
        fill_in 'search_title', with: 'test'
        click_button '検索'
        expect(page).not_to have_content 'article_a'
      end
    end
  end
end