# frozen_string_literal: true

require 'test_helper'

class PlacesControllerTest < ActionController::TestCase
  setup do
    @place = places(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:places)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create place' do
    assert_difference('Place.count') do
      post :create, params: { place: { address: @place.address, latitude: @place.latitude, longitude: @place.longitude, quotation_id: @place.quotation_id, user_id: @place.user_id } }
    end

    assert_redirected_to place_path(assigns(:place))
  end

  test 'should show place' do
    get :show, params: { id: @place }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @place }
    assert_response :success
  end

  test 'should update place' do
    patch :update, params: { id: @place, place: { address: @place.address, latitude: @place.latitude, longitude: @place.longitude, quotation_id: @place.quotation_id, user_id: @place.user_id } }
    assert_redirected_to place_path(assigns(:place))
  end

  test 'should destroy place' do
    assert_difference('Place.count', -1) do
      delete :destroy, params: { id: @place }
    end

    assert_redirected_to places_path
  end
end
