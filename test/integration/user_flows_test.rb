require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  test "cannot create an article" do
    get "/articles/new"
    assert_response :redirect
  end

  test "create article" do
    visit("/users/sign_up")
    within("form#new_user") do
      fill_in("user[name]", with: "foo")
      fill_in("user[email]", with: "foobar@qq.com")
      fill_in("user[password]", with: "123456")
      fill_in("user[password_confirmation]", with: "123456")
      click_on("Sign up")
    end
    assert User.all.size > 0
    assert_equal "foo", User.first.name

    visit("/")
    refute page.has_content?("Sign in")

    refute Article.all.size > 0
    post articles_path, params: {
      article: {title: "go play", body: "play", catalog_id: 1}
    }
    assert_response :redirect
  end
end
