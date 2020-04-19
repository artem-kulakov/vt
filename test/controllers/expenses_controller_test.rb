# frozen_string_literal: true

require 'test_helper'

class ExpensesControllerTest < ActionController::TestCase
  setup do
    @expense = expenses(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:expenses)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create expense' do
    assert_difference('Expense.count') do
      post :create, params: { expense: { ano: @expense.ano, bus_id: @expense.bus_id, cantidad: @expense.cantidad, categoria: @expense.categoria, fecha: @expense.fecha, mes: @expense.mes, nota: @expense.nota } }
    end

    assert_redirected_to expense_path(assigns(:expense))
  end

  test 'should show expense' do
    get :show, params: { id: @expense }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @expense }
    assert_response :success
  end

  test 'should update expense' do
    patch :update, params: { id: @expense, expense: { ano: @expense.ano, bus_id: @expense.bus_id, cantidad: @expense.cantidad, categoria: @expense.categoria, fecha: @expense.fecha, mes: @expense.mes, nota: @expense.nota } }
    assert_redirected_to expense_path(assigns(:expense))
  end

  test 'should destroy expense' do
    assert_difference('Expense.count', -1) do
      delete :destroy, params: { id: @expense }
    end

    assert_redirected_to expenses_path
  end
end
