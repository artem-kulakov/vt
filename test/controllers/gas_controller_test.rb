# frozen_string_literal: true

require 'test_helper'

class GasControllerTest < ActionController::TestCase
  setup do
    @ga = gas(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:gas)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create ga' do
    assert_difference('Ga.count') do
      post :create, params: { ga: { ano: @ga.ano, cantidad: @ga.cantidad, fecha: @ga.fecha, mes: @ga.mes } }
    end

    assert_redirected_to ga_path(assigns(:ga))
  end

  test 'should show ga' do
    get :show, params: { id: @ga }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @ga }
    assert_response :success
  end

  test 'should update ga' do
    patch :update, params: { id: @ga, ga: { ano: @ga.ano, cantidad: @ga.cantidad, fecha: @ga.fecha, mes: @ga.mes } }
    assert_redirected_to ga_path(assigns(:ga))
  end

  test 'should destroy ga' do
    assert_difference('Ga.count', -1) do
      delete :destroy, params: { id: @ga }
    end

    assert_redirected_to gas_path
  end
end
