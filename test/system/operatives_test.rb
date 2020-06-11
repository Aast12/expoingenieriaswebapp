require "application_system_test_case"

class OperativesTest < ApplicationSystemTestCase
  setup do
    @operative = operatives(:one)
  end

  test "visiting the index" do
    visit operatives_url
    assert_selector "h1", text: "Operatives"
  end

  test "creating a Operative" do
    visit operatives_url
    click_on "New Operative"

    click_on "Create Operative"

    assert_text "Operative was successfully created"
    click_on "Back"
  end

  test "updating a Operative" do
    visit operatives_url
    click_on "Edit", match: :first

    click_on "Update Operative"

    assert_text "Operative was successfully updated"
    click_on "Back"
  end

  test "destroying a Operative" do
    visit operatives_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Operative was successfully destroyed"
  end
end
