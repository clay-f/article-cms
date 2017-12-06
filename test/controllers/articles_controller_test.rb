require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get  articles_url
    assert_response :success
  end

  test "application header" do
    visit(root_path)
    assert click_link("Sign in")
    assert click_button("Search")
    assert click_on("Search")
    assert click_link("Sign up")
    assert fill_in("search", with: "golden")
    assert page.has_selector?("form")
    assert find_field("search").value
    assert find_field(id: "search").value
    assert assert find_link("Catalog", visible: :all).visible?
  end
end
