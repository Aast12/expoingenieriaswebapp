require "application_system_test_case"

class CommitteeMembersTest < ApplicationSystemTestCase
  setup do
    @committee_member = committee_members(:one)
  end

  test "visiting the index" do
    visit committee_members_url
    assert_selector "h1", text: "Committee Members"
  end

  test "creating a Committee member" do
    visit committee_members_url
    click_on "New Committee Member"

    click_on "Create Committee member"

    assert_text "Committee member was successfully created"
    click_on "Back"
  end

  test "updating a Committee member" do
    visit committee_members_url
    click_on "Edit", match: :first

    click_on "Update Committee member"

    assert_text "Committee member was successfully updated"
    click_on "Back"
  end

  test "destroying a Committee member" do
    visit committee_members_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Committee member was successfully destroyed"
  end
end
