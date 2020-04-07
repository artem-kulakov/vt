require 'test_helper'

class CheckupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @checkup = checkups(:one)
  end

  test "should get index" do
    get checkups_url
    assert_response :success
  end

  test "should get new" do
    get new_checkup_url
    assert_response :success
  end

  test "should create checkup" do
    assert_difference('Checkup.count') do
      post checkups_url, params: { checkup: { bus_id: @checkup.bus_id, category: @checkup.category, comment: @checkup.comment, fecha_fin: @checkup.fecha_fin, fecha_inicio: @checkup.fecha_inicio } }
    end

    assert_redirected_to checkup_url(Checkup.last)
  end

  test "should show checkup" do
    get checkup_url(@checkup)
    assert_response :success
  end

  test "should get edit" do
    get edit_checkup_url(@checkup)
    assert_response :success
  end

  test "should update checkup" do
    patch checkup_url(@checkup), params: { checkup: { bus_id: @checkup.bus_id, category: @checkup.category, comment: @checkup.comment, fecha_fin: @checkup.fecha_fin, fecha_inicio: @checkup.fecha_inicio } }
    assert_redirected_to checkup_url(@checkup)
  end

  test "should destroy checkup" do
    assert_difference('Checkup.count', -1) do
      delete checkup_url(@checkup)
    end

    assert_redirected_to checkups_url
  end
end
