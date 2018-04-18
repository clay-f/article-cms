require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = create(:comment)
  end

  test "user add comment" do
    user = create(:foo)
    user.comments << @comment
    assert user.comments.size > 0
  end
end