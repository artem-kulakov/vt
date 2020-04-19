# frozen_string_literal: true

require 'test_helper'

class PaymentsControllerTest < ActionController::TestCase
  setup do
    @payment = payments(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:payments)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create payment' do
    assert_difference('Payment.count') do
      post :create, params: { payment: { cantidad: @payment.cantidad, fecha: @payment.fecha, metodo: @payment.metodo, num_recibo: @payment.num_recibo, record_id: @payment.record_id, user_id: @payment.user_id } }
    end

    assert_redirected_to payment_path(assigns(:payment))
  end

  test 'should show payment' do
    get :show, params: { id: @payment }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @payment }
    assert_response :success
  end

  test 'should update payment' do
    patch :update, params: { id: @payment, payment: { cantidad: @payment.cantidad, fecha: @payment.fecha, metodo: @payment.metodo, num_recibo: @payment.num_recibo, record_id: @payment.record_id, user_id: @payment.user_id } }
    assert_redirected_to payment_path(assigns(:payment))
  end

  test 'should destroy payment' do
    assert_difference('Payment.count', -1) do
      delete :destroy, params: { id: @payment }
    end

    assert_redirected_to payments_path
  end
end
