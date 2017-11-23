require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = build(:comment)
  end

  test "get user with comment" do
    assert @comment.user.id > 0
  end

  test "add comment by user" do
    foo = create(:foo)
    assert foo.id > 0
    foo_comment = build(:foo_comment)
    foo_comment.user_id = foo.id
    foo.comments.create(foo_comment.to_hash)
    assert foo.comments.size > 0
  end
end
