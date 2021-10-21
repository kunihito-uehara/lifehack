#admin
User.create!(
  name: "uekuni", 
  email: "uekuni@dic.com", 
  like_hack:"パワーナップ"
  password: "123456", 
  password_confirmation: "123456",
  admin: true)

  #users
  user = User.create!(
    name: "Mario", 
    email: "mario@dic.com", 
    like_hack:"ブラインドタッチ"
    password: "111111", 
    password_confirmation: "111111",
    admin: true)

  user = User.create!(
    name: "Luigi", 
    email: "luigi@dic.com", 
    like_hack:"傾聴力"
    password: "111111", 
    password_confirmation: "111111",
    admin: true)

  user = User.create!(
    name: "Wario", 
    email: "wario@dic.com", 
    like_hack:"日記を書く"
    password: "111111", 
    password_confirmation: "111111",
    admin: true)

  user = User.create!(
    name: "Koopa", 
    email: "koopa@dic.com", 
    like_hack:"瞑想"
    password: "111111", 
    password_confirmation: "111111",
    admin: true)

  user = User.create!(
    name: "Peach", 
    email: "peach@dic.com", 
    like_hack:"涙を流す"
    password: "111111", 
    password_confirmation: "111111",
    admin: true)

    Article.create!(title: "test1", content: "content1", user_id: 1)
    Article.create!(title: "test2", content: "content2", user_id: 2)
    Article.create!(title: "test3", content: "content3", user_id: 3)
    Article.create!(title: "test4", content: "content4", user_id: 4)
    Article.create!(title: "test5", content: "content5", user_id: 5)
    
    Comment.create!(article_id: 1, content: "コメント1")
    Comment.create!(article_id: 2, content: "コメント2")
    Comment.create!(article_id: 3, content: "コメント3")
    Comment.create!(article_id: 4, content: "コメント4")
    Comment.create!(article_id: 5, content: "コメント5")

    Favorites.create!(user_id: 1, article_id: 1)
    Favorites.create!(user_id: 2, article_id: 2)
    Favorites.create!(user_id: 3, article_id: 3)
    Favorites.create!(user_id: 4, article_id: 4)
    Favorites.create!(user_id: 5, article_id: 5)


    Request_themes.create!(name: "name1",title: "test1", user_id: 1)
    Request_themes.create!(name: "name2",title: "test2", user_id: 2)
    Request_themes.create!(name: "name3",title: "test3", user_id: 3)
    Request_themes.create!(name: "name4",title: "test4", user_id: 4)
    Request_themes.create!(name: "name5",title: "test5", user_id: 5)

  end