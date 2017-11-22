require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = build(:user)
    @foo = build(:foo)
  end

  test "get default user" do
    assert @user.id > 0
  end

  test "add user" do
    user = User.new
    refute user.valid?
    user.id = 3
    user.name = "user"
    refute user.valid?
    user.email = "tmp_user@qq.com"
    refute user.valid?
    user.password = "1234"
    refute user.valid?
    user.password = "123456"
    assert user.valid?
    tmp_user = user.to_hash
    User.create(tmp_user)
    assert User.all.size > 0
  end

  test "delete user" do
    @user
    @foo
    User.create(@user.to_hash)
    User.create(@foo.to_hash)
    assert User.all.size > 0
    assert_difference 'User.count', -1 do
      User.first.delete
    end
  end

end
