# frozen_string_literal: true

require 'test_helper'

class ServicesControllerTest < ActionController::TestCase
  setup do
    @service = services(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:services)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create service' do
    assert_difference('Service.count') do
      post :create, params: { service: { aeropuerto: @service.aeropuerto, bus_id: @service.bus_id, caseta: @service.caseta, dia_extra: @service.dia_extra, diesel: @service.diesel, estacionamientos: @service.estacionamientos, hotel: @service.hotel, km_fin: @service.km_fin, km_inicio: @service.km_inicio, lavadas: @service.lavadas, otros: @service.otros, precio_unidad: @service.precio_unidad, record_id: @service.record_id, user_id: @service.user_id, viaticos: @service.viaticos } }
    end

    assert_redirected_to service_path(assigns(:service))
  end

  test 'should show service' do
    get :show, params: { id: @service }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @service }
    assert_response :success
  end

  test 'should update service' do
    patch :update, params: { id: @service, service: { aeropuerto: @service.aeropuerto, bus_id: @service.bus_id, caseta: @service.caseta, dia_extra: @service.dia_extra, diesel: @service.diesel, estacionamientos: @service.estacionamientos, hotel: @service.hotel, km_fin: @service.km_fin, km_inicio: @service.km_inicio, lavadas: @service.lavadas, otros: @service.otros, precio_unidad: @service.precio_unidad, record_id: @service.record_id, user_id: @service.user_id, viaticos: @service.viaticos } }
    assert_redirected_to service_path(assigns(:service))
  end

  test 'should destroy service' do
    assert_difference('Service.count', -1) do
      delete :destroy, params: { id: @service }
    end

    assert_redirected_to services_path
  end
end
