require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  test "invalid signup information" do
      get signup_path
      assert_no_difference 'User.count' do
        post users_path, params: { user: { name:  "",
                                           email: "user@invalid",
                                           password:              "foo",
                                           password_confirmation: "bar" } }
      end
      assert_template 'users/new'
      assert_select '#user_name'
      assert_select '#user_email'
      assert_select '#user_password'
      assert_select '#user_password_confirmation'
      assert_select 'form[action="/signup"]'
    end
end
