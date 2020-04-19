# frozen_string_literal: true

require 'test_helper'

class RoutesControllerTest < ActionController::TestCase
  setup do
    @route = routes(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:routes)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create route' do
    assert_difference('Route.count') do
      post :create, params: { route: { place: @route.place, record_id: @route.record_id, user_id: @route.user_id } }
    end

    assert_redirected_to route_path(assigns(:route))
  end

  test 'should show route' do
    get :show, params: { id: @route }
    assert_response :success
  end

  test 'should get edit' do
    get :edit, params: { id: @route }
    assert_response :success
  end

  test 'should update route' do
    patch :update, params: { id: @route, route: { place: @route.place, record_id: @route.record_id, user_id: @route.user_id } }
    assert_redirected_to route_path(assigns(:route))
  end

  test 'should destroy route' do
    assert_difference('Route.count', -1) do
      delete :destroy, params: { id: @route }
    end

    assert_redirected_to routes_path
  end
end
