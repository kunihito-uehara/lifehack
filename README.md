![lifehack_logo](https://user-images.githubusercontent.com/82615825/134606612-849ce256-d5eb-4b36-97e5-f614b9c96581.png)


## アプリ概要
ライフハック好きが集まるコミュニティー！

あなたの悩みをみんなのライフハックで解決！

さぁシゴトも、人生も、もっと楽しもう！

URL：https://young-peak-69014.herokuapp.com/





## 😆 作成背景：

ライフハックで生産性が上がるのが実感できるから、みんなに知って欲しい！

利用するメリット：
ライフハックの知見が増え、生活のクオリティーが上がる!

## 💻 開発環境

- OS：
- 言語： Ruby 2.6.5, HTML, CSS, JavaScript, SQL
- フレームワーク： Ruby on Rails 5.2.5, Bootstrap
- JS ライブラリ： jQuery

## 📚 機能一覧

- テーマリクエスト機能
- 新規登録・ログイン機能
- 検索機能
- 投稿機能

- アドミン（サイト管理者）
  - 不正な利用者の削除・編集機能

## 😃 就業 Term の技術

- devise
- お気に入り機能

## 😃 カリキュラム外の技術

- ransack

## 📝 使用 Gem 等一覧

- ログイン・管理者関連
  - devise
  - devise-i18n
  - rails_admin
  - cancancan
- 画像アップロード

  - mini_magick

- 検索機能： ransack
- デバック： byebug
- Rspec： rspec-rails
- ページネーション： kaminari

## カタログ設計

https://docs.google.com/spreadsheets/d/1R363adq6ZM8fI_gMqQx46jN10OWv6CEXzrlQh3C6FZU/edit#gid=1907569507

## テーブル設計

https://docs.google.com/spreadsheets/d/1R363adq6ZM8fI_gMqQx46jN10OWv6CEXzrlQh3C6FZU/edit#gid=1249328897

## ER 図

https://cacoo.com/diagrams/OswHFzNK6PBkxJZC/3F890?reload_rt=1632802020635_0

## 画面遷移図

https://cacoo.com/diagrams/OswHFzNK6PBkxJZC/FB154?reload_rt=1632802018318_0

## ワイヤーフレーム

https://cacoo.com/diagrams/OswHFzNK6PBkxJZC/C6F50?reload_rt=1632802020635_0

## 実行手順

```
$ git clone git@github.com:kunihito-uehara/LIFE-HACK.git
$ cd lifehack
$ bundle install
$ rails db:create db:migrate
$ rails s
```
