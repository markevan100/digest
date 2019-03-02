require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "sports")
  end

  test "category should not be valid without user" do
    refute @category.valid?
    user = User.create(username: "via seedfile", email: "josh@josh.com", password_digest: "password")
    @category.user_id = user.id
    assert @category.valid?
  end

  test "name should be present" do
    @category.name = " "
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
  end

  test "name should not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end

  test "name should not be too short" do
    @category.name = "aa"
    assert_not @category.valid?
  end

  test "associations" do
    user = User.create(username: "via seedfile", email: "josh@josh.com", password_digest: "password")
    cat = Category.create(name: "cat1", user_id: user.id)
    cat.save
    cat.discussions.create(title: "foo", question: "barbarbagerlkjklj", user_id: user.id).save
    
    assert_equal cat.discussions.first.id, Discussion.last.id
  end
end
