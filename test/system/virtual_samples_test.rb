require "application_system_test_case"

class VirtualSamplesTest < ApplicationSystemTestCase
  setup do
    @virtual_sample = virtual_samples(:one)
  end

  test "visiting the index" do
    visit virtual_samples_url
    assert_selector "h1", text: "Virtual Samples"
  end

  test "creating a Virtual sample" do
    visit virtual_samples_url
    click_on "New Virtual Sample"

    click_on "Create Virtual sample"

    assert_text "Virtual sample was successfully created"
    click_on "Back"
  end

  test "updating a Virtual sample" do
    visit virtual_samples_url
    click_on "Edit", match: :first

    click_on "Update Virtual sample"

    assert_text "Virtual sample was successfully updated"
    click_on "Back"
  end

  test "destroying a Virtual sample" do
    visit virtual_samples_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Virtual sample was successfully destroyed"
  end
end
