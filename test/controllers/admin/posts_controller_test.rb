require "test_helper"

class Admin::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:user_one)
    @user.skip_confirmation!
    @user.add_role :client
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

  test 'client user can access new action' do
    get new_admin_post_path
    assert_response :success
  end

  test "freelancer can't access new action for post" do
    @user.remove_role :client
    @user.add_role :freelancer

    assert_raises(Pundit::NotAuthorizedError){get new_admin_post_path}
  end
end