# frozen_string_literal: true

require 'test_helper'

class RecordsControllerTest < ActionController::TestCase
  setup do
    @record = records(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:records)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create record' do
    assert_difference('Record.count') do
      post :create, params: { record: { client_id: @record.client_id, distancia: @record.distancia, end_time: @record.end_time, factura: @record.factura, finish_time: @record.finish_time, initial_time: @record.initial_time, lugar_salida: @record.lugar_salida, nombre_referencia: @record.nombre_referencia, num_factura: @record.num_factura, numero_de_camiones: @record.numero_de_camiones, numero_pasajeros: @record.numero_pasajeros, observaciones: @record.observaciones, precio: @record.precio, precio: @record.precio, referencia_salida: @record.referencia_salida, start_time: @record.start_time, status_admin: @record.status_admin, status_op: @record.status_op, telefono_referencia: @record.telefono_referencia, title: @record.title, user_id: @record.user_id } }
    end

    assert_redirected_to record_path(assigns(:record))
  end

  test 'should show record' do
    get :show, params: { id: @record }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @record }
    assert_response :success
  end

  test 'should update record' do
    patch :update, params: { id: @record, record: { client_id: @record.client_id, distancia: @record.distancia, end_time: @record.end_time, factura: @record.factura, finish_time: @record.finish_time, initial_time: @record.initial_time, lugar_salida: @record.lugar_salida, nombre_referencia: @record.nombre_referencia, num_factura: @record.num_factura, numero_de_camiones: @record.numero_de_camiones, numero_pasajeros: @record.numero_pasajeros, observaciones: @record.observaciones, precio: @record.precio, precio: @record.precio, referencia_salida: @record.referencia_salida, start_time: @record.start_time, status_admin: @record.status_admin, status_op: @record.status_op, telefono_referencia: @record.telefono_referencia, title: @record.title, user_id: @record.user_id } }
    assert_redirected_to record_path(assigns(:record))
  end

  test 'should destroy record' do
    assert_difference('Record.count', -1) do
      delete :destroy, params: { id: @record }
    end

    assert_redirected_to records_path
  end
end
