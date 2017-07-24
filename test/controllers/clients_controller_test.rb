require 'test_helper'

class ClientsControllerTest < ActionController::TestCase
  setup do
    @client = clients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:clients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client" do
    assert_difference('Client.count') do
      post :create, client: { alias: @client.alias, calle_y_numero: @client.calle_y_numero, colonia: @client.colonia, cp: @client.cp, email: @client.email, email_cobro: @client.email_cobro, estado: @client.estado, municipio: @client.municipio, nombre_cobro: @client.nombre_cobro, pais: @client.pais, razon_social: @client.razon_social, rfc: @client.rfc, telefono: @client.telefono, telefono_cobro: @client.telefono_cobro, user_id: @client.user_id }
    end

    assert_redirected_to client_path(assigns(:client))
  end

  test "should show client" do
    get :show, id: @client
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client
    assert_response :success
  end

  test "should update client" do
    patch :update, id: @client, client: { alias: @client.alias, calle_y_numero: @client.calle_y_numero, colonia: @client.colonia, cp: @client.cp, email: @client.email, email_cobro: @client.email_cobro, estado: @client.estado, municipio: @client.municipio, nombre_cobro: @client.nombre_cobro, pais: @client.pais, razon_social: @client.razon_social, rfc: @client.rfc, telefono: @client.telefono, telefono_cobro: @client.telefono_cobro, user_id: @client.user_id }
    assert_redirected_to client_path(assigns(:client))
  end

  test "should destroy client" do
    assert_difference('Client.count', -1) do
      delete :destroy, id: @client
    end

    assert_redirected_to clients_path
  end
end
