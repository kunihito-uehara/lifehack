#users
user1 = User.create!(
  name: "Mario", 
  email: "mario@dic.com", 
  like_hack:"ブラインドタッチ",
  password: "111111", 
  password_confirmation: "111111",
  admin: false
)

user2 = User.create!(
  name: "Luigi", 
  email: "luigi@dic.com", 
  like_hack:"朝散歩",
  password: "111111", 
  password_confirmation: "111111",
  admin: false
)

user3 = User.create!(
  name: "Wario", 
  email: "wario@dic.com", 
  like_hack:"日記を書く",
  password: "111111", 
  password_confirmation: "111111",
  admin: false
)

user4 = User.create!(
  name: "Koopa", 
  email: "koopa@dic.com", 
  like_hack:"瞑想",
  password: "111111", 
  password_confirmation: "111111",
  admin: false
)

user5 = User.create!(
  name: "Peach", 
  email: "peach@dic.com", 
  like_hack:"涙を流す",
  password: "111111", 
  password_confirmation: "111111",
  admin: false
)

#admin
user6 = User.create!(
  name: "uekuni",
  email: "uekuni@dic.com",
  like_hack: "パワーナップ",
  password: "123456",
  password_confirmation: "123456",
  admin: true
)

users = { "user1": user1, "user2": user2, "user3": user3, "user4": user4, "user5": user5, "user6": user6 }

60.times {|n|
  article = Article.create(title: "article_title_#{n}", user_id: user6.id)
  10.times { |num|
    Comment.create(content: "comment_content#{n}", article_id: article.id, user_id: users[:"user#{rand(1..6)}"].id)
    Comment.create(content: "comment_content#{num}", article_id: article.id, user_id: users[:"user#{rand(1..6)}"].id)
  }
  Favorite.create(user_id: rand(1..5), article_id: article.id)
  RequestTheme.create(name: "name_#{n}", title: "title_#{n}", user_id: rand(1..5))
}

# article = Article.create(title: "仕事の効率アップしたワークハック教えて", user_id: user6.id)
# article = Article.create(title: "集中力が上がる方法を教えて", user_id: user6.id)
# article = Article.create(title: "睡眠の質をあげるライフハック教えて", user_id: user6.id)
# article = Article.create(title: "モチベーションをあげる方法を教えて", user_id: user6.id)
# article = Article.create(title: "DICで学ぶ上で大事なことを教えて", user_id: user6.id)


# Article.create!(title: "記事1", content: "content1", user_id: 1, article_id: 1)
# Comment.create!(article_id: 1, user_id: 1, content: "コメント1")
# Favorites.create!(user_id: 1, article_id: 1)
# Request_themes.create!(name: "name1",title: "test1", user_id: 1)