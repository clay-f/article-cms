require 'test_helper'

class CatalogTest < ActiveSupport::TestCase
  test "get all catalog size" do
    history = create(:history)
    technology = create(:technology)
    philosophy = create(:philosophy)
    assert Catalog.count == 3
  end
end
