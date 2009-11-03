require File.dirname(__FILE__) + '/../test_helper'

class InfosControllerTest < ActionController::TestCase

  def test_index_without_login
    get :index

    assert_response :redirect
    assert_redirected_to "/"
  end

  def test_index_with_login_as_normal_user
    login_as :khanh
    get :index

    assert_response :redirect
    assert_redirected_to "/"
  end

  def test_index_with_login_as_admin
    login_as :admin
    get :index

    assert_response :success
    assert_template "index"
  end

  def test_new_with_login_as_admin
    login_as :admin
    get :new
    assert_response :success
  end
  
  def test_new_with_login_as_normal_user
    login_as :khanh
    get :new
    assert_response :redirect
    assert_redirected_to "/"
#    assert_render :controller => 'stwittergy', :action => 'report'
  end
  
  def test_new_without_login
    get :new
    assert_response :redirect
    assert_redirected_to '/'
  end

  def test_should_create_info_for_admin
    login_as :admin
    assert_difference("Info.count",1) do
      post :create, :info => { }
    end
    assert_redirected_to :action => 'index'
    assert_equal 'Info was successfully created.', flash[:notice]
  end
  
  def test_should_show_info
    get :show, :id => infos(:one).to_param
    assert_response :redirect
    assert_redirected_to "/"
  end

  def test_should_display_info_to_nonuser
    get :display, :id => infos(:one).to_param
    assert_response :success
    assert_template "display"
  end

  def test_should_edit_info_for_admin
    login_as :admin
    get :edit, :id => infos(:one).to_param
    assert_response :success
    assert_template "edit"
  end
  
  def test_should_update_info_for_admin
    login_as :admin
    put :update, :id => infos(:two).to_param, :info => { :content => "updated 2nd story" }
    assert_response :redirect
    assert_redirected_to :action => 'index'
  end
  
  def test_should_not_update_info_for_user
    login_as :khanh
    put :update, :id => infos(:one).to_param, :info => { }
    assert_response :redirect
    assert_redirected_to "/"
  end
  
  def test_should_not_update_info_for_nobody
    put :update, :id => infos(:one).to_param, :info => { }
    assert_response :redirect
    assert_redirected_to "/"
  end  

  def test_should_destroy_info_for_admin
    login_as :admin  
    assert_difference('Info.count', -1) do
      delete :destroy, :id => infos(:one).to_param
    end
    assert_redirected_to :controller => 'infos', :action => 'index'
  end
  
  def test_should_not_destroy_for_user
    login_as :khanh
    delete :destroy, :id => infos(:one).to_param
    assert_response :redirect
    assert_redirected_to "/"
  end
  
end
