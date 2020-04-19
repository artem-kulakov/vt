# frozen_string_literal: true

require 'test_helper'

class OperatorsControllerTest < ActionController::TestCase
  setup do
    @operator = operators(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:operators)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create operator' do
    assert_difference('Operator.count') do
      post :create, params: { operator: { nombre: @operator.nombre, observaciones: @operator.observaciones, papeles: @operator.papeles, telefono: @operator.telefono, user_id: @operator.user_id } }
    end

    assert_redirected_to operator_path(assigns(:operator))
  end

  test 'should show operator' do
    get :show, params: { id: @operator }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @operator }
    assert_response :success
  end

  test 'should update operator' do
    patch :update, params: { id: @operator, operator: { nombre: @operator.nombre, observaciones: @operator.observaciones, papeles: @operator.papeles, telefono: @operator.telefono, user_id: @operator.user_id } }
    assert_redirected_to operator_path(assigns(:operator))
  end

  test 'should destroy operator' do
    assert_difference('Operator.count', -1) do
      delete :destroy, params: { id: @operator }
    end

    assert_redirected_to operators_path
  end
end
