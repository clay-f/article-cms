require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  test "cannot create an article" do
    get "/articles/new"
    assert_response :redirect
  end

  test "create article" do
    visit('/')    
    click_link('Sign in')
    within("form#new_user") do
      fill_in "Login", with: "foo"
      fill_in "Password", with: "123456"
      click_on "Log in"
    end
  end
end
