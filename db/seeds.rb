begin
  Catalog.delete_all
  User.delete_all
  Article.delete_all

  Catalog.create([
    {name: "History"},
    {name: "Biography"},
    {name: "Technology"}])

  user = User.create(name: "foo", password: "123456", email: "foo@qq.com", avatar_file_name: "miss.png")
  user.articles.create(title: "foo", body: "foo foo", catalog_id: 1)
  user.articles.create(title: "bar", body: "bar bar", catalog_id: 2)
rescue Exception => e
  puts  e.message
end
