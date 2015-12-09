require 'test_helper'

class ClientAppsControllerTest < ActionController::TestCase
  setup do
    @client_app = client_apps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_apps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_app" do
    assert_difference('ClientApp.count') do
      post :create, client_app: { name: @client_app.name, subdomain: @client_app.subdomain, tenant_name: @client_app.tenant_name }
    end

    assert_redirected_to client_app_path(assigns(:client_app))
  end

  test "should show client_app" do
    get :show, id: @client_app
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client_app
    assert_response :success
  end

  test "should update client_app" do
    patch :update, id: @client_app, client_app: { name: @client_app.name, subdomain: @client_app.subdomain, tenant_name: @client_app.tenant_name }
    assert_redirected_to client_app_path(assigns(:client_app))
  end

  test "should destroy client_app" do
    assert_difference('ClientApp.count', -1) do
      delete :destroy, id: @client_app
    end

    assert_redirected_to client_apps_path
  end
end
