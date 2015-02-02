require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @user = users(:michael)
    @question = @user.questions.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @question.valid?
  end

  test "user id should be present" do
    @question.user_id = nil
    assert_not @question.valid?
  end
  test "content should be present " do
    @micropost.content = "   "
    assert_not @micropost.valid?
  end

  test "content should be at most 140 characters" do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
  end
  test "order should be most recent first" do
    assert_equal Micropost.first, microposts(:most_recent)
  end
end
