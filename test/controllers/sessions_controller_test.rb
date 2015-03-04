require_relative '../test_helper'

class SessionsControllerTest < ActionController::TestCase
  # render_views

  def test_get_show_tells_if_im_logged_in
    session[:user_id] = nil
    get :index
    assert_response :success
    data = JSON.parse(@response.body)
    assert_equal false, data["logged_in"]
  end

  def test_get_index_includes_user_data_if_logged_in
    u = User.create!(first_name: "worace", email: "worace@worace.worace")
    session[:user_id] = u.id
    get :index
    assert_response :success
    data = JSON.parse(@response.body)
    assert_equal true, data["logged_in"]
    assert_equal "worace", data["first_name"]
    assert_equal "worace@worace.worace", data["email"]
  end

  def test_new_gets_the_form
    get :new
    assert_response :success
    assert_select "form"
  end

  def test_post_create_logs_me_in
    u = User.create!(first_name: "worace", email: "worace@worace.worace", password: "pizza", password_confirmation: "pizza")
    post :create, email: u.email, password: "pizza"
    assert_response :success
    assert_equal u.id, session[:user_id]
  end
end
