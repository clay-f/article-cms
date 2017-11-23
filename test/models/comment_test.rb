require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  def setup
    @comment = build(:comment)
    @foo_comment = Comment.create(id: 2, name: "foo", description: "fooffsad", article_id: 1)
  end

  test "user add comment" do
    user = create(:foo)
    assert user.comments.size.zero?
    user.comments.create(@foo_comment.to_hash)
    assert user.comments.size > 0
  end
end