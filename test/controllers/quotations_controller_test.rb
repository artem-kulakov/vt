# frozen_string_literal: true

require 'test_helper'

class QuotationsControllerTest < ActionController::TestCase
  setup do
    @quotation = quotations(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:quotations)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create quotation' do
    assert_difference('Quotation.count') do
      post :create, params: { quotation: { dia_extra1: @quotation.dia_extra1, dia_extra2: @quotation.dia_extra2, dia_extra3: @quotation.dia_extra3, dia_extra4: @quotation.dia_extra4, distancia: @quotation.distancia, email: @quotation.email, fecha_fin: @quotation.fecha_fin, fecha_inicio: @quotation.fecha_inicio, nombre: @quotation.nombre, num_dias: @quotation.num_dias, observaciones: @quotation.observaciones, origen: @quotation.origen, pasajeros: @quotation.pasajeros, segmento1: @quotation.segmento1, segmento2: @quotation.segmento2, segmento3: @quotation.segmento3, segmento4: @quotation.segmento4, telefono: @quotation.telefono, user_id: @quotation.user_id } }
    end

    assert_redirected_to quotation_path(assigns(:quotation))
  end

  test 'should show quotation' do
    get :show, params: { id: @quotation }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @quotation }
    assert_response :success
  end

  test 'should update quotation' do
    patch :update, params: { id: @quotation, quotation: { dia_extra1: @quotation.dia_extra1, dia_extra2: @quotation.dia_extra2, dia_extra3: @quotation.dia_extra3, dia_extra4: @quotation.dia_extra4, distancia: @quotation.distancia, email: @quotation.email, fecha_fin: @quotation.fecha_fin, fecha_inicio: @quotation.fecha_inicio, nombre: @quotation.nombre, num_dias: @quotation.num_dias, observaciones: @quotation.observaciones, origen: @quotation.origen, pasajeros: @quotation.pasajeros, segmento1: @quotation.segmento1, segmento2: @quotation.segmento2, segmento3: @quotation.segmento3, segmento4: @quotation.segmento4, telefono: @quotation.telefono, user_id: @quotation.user_id } }
    assert_redirected_to quotation_path(assigns(:quotation))
  end

  test 'should destroy quotation' do
    assert_difference('Quotation.count', -1) do
      delete :destroy, params: { id: @quotation }
    end

    assert_redirected_to quotations_path
  end
end
