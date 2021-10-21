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
    like_hack:"パワーナップ"
    password: "111111", 
    password_confirmation: "111111",
    admin: true)

  user = User.create!(
    name: "Luigi", 
    email: "luigi@dic.com", 
    like_hack:"パワーナップ"
    password: "111111", 
    password_confirmation: "111111",
    admin: true)

  user = User.create!(
    name: "Wario", 
    email: "wario@dic.com", 
    like_hack:"パワーナップ"
    password: "111111", 
    password_confirmation: "111111",
    admin: true)

  user = User.create!(
    name: "Koopa", 
    email: "koopa@dic.com", 
    like_hack:"パワーナップ"
    password: "111111", 
    password_confirmation: "111111",
    admin: true)

  user = User.create!(
    name: "Peach", 
    email: "peach@dic.com", 
    like_hack:"パワーナップ"
    password: "111111", 
    password_confirmation: "111111",
    admin: true)

      


  end