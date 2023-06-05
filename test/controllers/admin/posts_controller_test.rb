require "test_helper"

class Admin::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:user_one)
    @user.skip_confirmation!
    sign_in @user
  end

  test "should get index" do
    get root_url
    assert_response :success
  end

  test 'should not get index without sign in' do
    sign_out @user

    get root_url
    assert_redirected_to new_user_session_path
  end
end