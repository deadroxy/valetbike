require "test_helper"

class StationLocsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @station_loc = station_locs(:one)
  end

  test "should get index" do
    get station_locs_url
    assert_response :success
  end

  test "should get new" do
    get new_station_loc_url
    assert_response :success
  end

  test "should create station_loc" do
    assert_difference("StationLoc.count") do
      post station_locs_url, params: { station_loc: { address: @station_loc.address, latitude: @station_loc.latitude, longitude: @station_loc.longitude, name: @station_loc.name } }
    end

    assert_redirected_to station_loc_url(StationLoc.last)
  end

  test "should show station_loc" do
    get station_loc_url(@station_loc)
    assert_response :success
  end

  test "should get edit" do
    get edit_station_loc_url(@station_loc)
    assert_response :success
  end

  test "should update station_loc" do
    patch station_loc_url(@station_loc), params: { station_loc: { address: @station_loc.address, latitude: @station_loc.latitude, longitude: @station_loc.longitude, name: @station_loc.name } }
    assert_redirected_to station_loc_url(@station_loc)
  end

  test "should destroy station_loc" do
    assert_difference("StationLoc.count", -1) do
      delete station_loc_url(@station_loc)
    end

    assert_redirected_to station_locs_url
  end
end
