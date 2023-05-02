require "application_system_test_case"

class StationLocsTest < ApplicationSystemTestCase
  setup do
    @station_loc = station_locs(:one)
  end

  test "visiting the index" do
    visit station_locs_url
    assert_selector "h1", text: "Station locs"
  end

  test "should create station loc" do
    visit station_locs_url
    click_on "New station loc"

    fill_in "Address", with: @station_loc.address
    fill_in "Latitude", with: @station_loc.latitude
    fill_in "Longitude", with: @station_loc.longitude
    fill_in "Name", with: @station_loc.name
    click_on "Create Station loc"

    assert_text "Station loc was successfully created"
    click_on "Back"
  end

  test "should update Station loc" do
    visit station_loc_url(@station_loc)
    click_on "Edit this station loc", match: :first

    fill_in "Address", with: @station_loc.address
    fill_in "Latitude", with: @station_loc.latitude
    fill_in "Longitude", with: @station_loc.longitude
    fill_in "Name", with: @station_loc.name
    click_on "Update Station loc"

    assert_text "Station loc was successfully updated"
    click_on "Back"
  end

  test "should destroy Station loc" do
    visit station_loc_url(@station_loc)
    click_on "Destroy this station loc", match: :first

    assert_text "Station loc was successfully destroyed"
  end
end
