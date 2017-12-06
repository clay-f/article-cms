begin
  Catalog.delete_all
  User.delete_all
  Article.delete_all
  MessageState.delete_all

  Catalog.create([
    {name: "History"},
    {name: "Biography"},
    {name: "Technology"}])

  MessageState.create([{state: "read"}, {state: "unread"}])

  user = User.create(name: Faker::Name.name, password: "123456", email: "foo@qq.com")
  User.create(name: Faker::Name.name, password: "123456", email: "bar@qq.com")
  User.create(name: Faker::Name.name, password: "123456", email: "baz@qq.com")
  user.articles.create(title: Faker::Book.title, body: Faker::TwinPeaks.quote, catalog_id: 1)
  user.articles.create(title: Faker::Book.title, body: Faker::TwinPeaks.quote, catalog_id: 2)
rescue Exception => e
  puts  e.message
end
