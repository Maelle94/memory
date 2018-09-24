require "application_system_test_case"

class CamerasTest < ApplicationSystemTestCase
  setup do
    @camera = cameras(:one)
  end

  test "visiting the index" do
    visit cameras_url
    assert_selector "h1", text: "Cameras"
  end

  test "creating a Camera" do
    visit cameras_url
    click_on "New Camera"

    fill_in "Bandwidth", with: @camera.bandwidth
    fill_in "Dimension", with: @camera.dimension
    fill_in "Name", with: @camera.name
    fill_in "Number Bands", with: @camera.number_bands
    fill_in "Number Channels", with: @camera.number_channels
    fill_in "Wave Length", with: @camera.wave_length
    fill_in "Year", with: @camera.year
    click_on "Create Camera"

    assert_text "Camera was successfully created"
    click_on "Back"
  end

  test "updating a Camera" do
    visit cameras_url
    click_on "Edit", match: :first

    fill_in "Bandwidth", with: @camera.bandwidth
    fill_in "Dimension", with: @camera.dimension
    fill_in "Name", with: @camera.name
    fill_in "Number Bands", with: @camera.number_bands
    fill_in "Number Channels", with: @camera.number_channels
    fill_in "Wave Length", with: @camera.wave_length
    fill_in "Year", with: @camera.year
    click_on "Update Camera"

    assert_text "Camera was successfully updated"
    click_on "Back"
  end

  test "destroying a Camera" do
    visit cameras_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Camera was successfully destroyed"
  end
end
