# frozen_string_literal: true

require 'test_helper'

class VouchersControllerTest < ActionController::TestCase
  setup do
    @voucher = vouchers(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:vouchers)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create voucher' do
    assert_difference('Voucher.count') do
      post :create, params: { voucher: { ano: @voucher.ano, cantidad: @voucher.cantidad, fecha: @voucher.fecha, mes: @voucher.mes, nota: @voucher.nota, operacion: @voucher.operacion, operator_id: @voucher.operator_id } }
    end

    assert_redirected_to voucher_path(assigns(:voucher))
  end

  test 'should show voucher' do
    get :show, params: { id: @voucher }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @voucher }
    assert_response :success
  end

  test 'should update voucher' do
    patch :update, params: { id: @voucher, voucher: { ano: @voucher.ano, cantidad: @voucher.cantidad, fecha: @voucher.fecha, mes: @voucher.mes, nota: @voucher.nota, operacion: @voucher.operacion, operator_id: @voucher.operator_id } }
    assert_redirected_to voucher_path(assigns(:voucher))
  end

  test 'should destroy voucher' do
    assert_difference('Voucher.count', -1) do
      delete :destroy, params: { id: @voucher }
    end

    assert_redirected_to vouchers_path
  end
end
