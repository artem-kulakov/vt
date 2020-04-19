# frozen_string_literal: true

require 'test_helper'

class BusesControllerTest < ActionController::TestCase
  setup do
    @bus = buses(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:buses)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create bus' do
    assert_difference('Bus.count') do
      post :create, params: { bus: { capacidad: @bus.capacidad, marca: @bus.marca, modelo: @bus.modelo, numero: @bus.numero, placa: @bus.placa, user_id: @bus.user_id, version: @bus.version } }
    end

    assert_redirected_to bus_path(assigns(:bus))
  end

  test 'should show bus' do
    get :show, params: { id: @bus }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @bus }
    assert_response :success
  end

  test 'should update bus' do
    patch :update, params: { id: @bus, bus: { capacidad: @bus.capacidad, marca: @bus.marca, modelo: @bus.modelo, numero: @bus.numero, placa: @bus.placa, user_id: @bus.user_id, version: @bus.version } }
    assert_redirected_to bus_path(assigns(:bus))
  end

  test 'should destroy bus' do
    assert_difference('Bus.count', -1) do
      delete :destroy, params: { id: @bus }
    end

    assert_redirected_to buses_path
  end
end
