require 'test_helper'

class SignupUserTest < ActionDispatch::IntegrationTest

  test 'can signup new user' do
    get signup_path
    assert_response :success

    post users_path,
    params: { user: { username: "joe", email: "joe@example.com", password: "foobar"}}
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_match "Welcome to joe's page", response.body
  end
end 
