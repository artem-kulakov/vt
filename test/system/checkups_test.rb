require "application_system_test_case"

class CheckupsTest < ApplicationSystemTestCase
  setup do
    @checkup = checkups(:one)
  end

  test "visiting the index" do
    visit checkups_url
    assert_selector "h1", text: "Checkups"
  end

  test "creating a Checkup" do
    visit checkups_url
    click_on "New Checkup"

    fill_in "Bus", with: @checkup.bus_id
    fill_in "Category", with: @checkup.category
    fill_in "Comment", with: @checkup.comment
    fill_in "Fecha fin", with: @checkup.fecha_fin
    fill_in "Fecha inicio", with: @checkup.fecha_inicio
    click_on "Create Checkup"

    assert_text "Checkup was successfully created"
    click_on "Back"
  end

  test "updating a Checkup" do
    visit checkups_url
    click_on "Edit", match: :first

    fill_in "Bus", with: @checkup.bus_id
    fill_in "Category", with: @checkup.category
    fill_in "Comment", with: @checkup.comment
    fill_in "Fecha fin", with: @checkup.fecha_fin
    fill_in "Fecha inicio", with: @checkup.fecha_inicio
    click_on "Update Checkup"

    assert_text "Checkup was successfully updated"
    click_on "Back"
  end

  test "destroying a Checkup" do
    visit checkups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Checkup was successfully destroyed"
  end
end
