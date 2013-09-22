require 'machinist/active_record'

Place.blueprint do
  name {"Place #{sn}"}
  email {"place#{sn}@place.com"}
  phone {"564656#{sn}"}
  address {"The street, #{sn}, Tallinn, Estonia"}
  url {"place#{sn}.com"}
end

User.blueprint do
  name {"User #{sn}"}
  email {"user#{sn}@place.com"}
  password {"password"}
  password_confirmation {"password"}
end

Post.blueprint do
  title {"Title #{sn}"}
  content {"Content #{sn}"}
end

Comment.blueprint do
  author {"Author #{sn}"}
  content {"Content #{sn}"}
  post { Post.make! }
end
