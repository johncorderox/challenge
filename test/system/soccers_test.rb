require "application_system_test_case"

class SoccersTest < ApplicationSystemTestCase
  setup do
    @soccer = soccers(:one)
  end

  test "visiting the index" do
    visit soccers_url
    assert_selector "h1", text: "Soccers"
  end

  test "creating a Soccer" do
    visit soccers_url
    click_on "New Soccer"

    fill_in "Against", with: @soccer.against
    fill_in "For", with: @soccer.for
    fill_in "Name", with: @soccer.name
    click_on "Create Soccer"

    assert_text "Soccer was successfully created"
    click_on "Back"
  end

  test "updating a Soccer" do
    visit soccers_url
    click_on "Edit", match: :first

    fill_in "Against", with: @soccer.against
    fill_in "For", with: @soccer.for
    fill_in "Name", with: @soccer.name
    click_on "Update Soccer"

    assert_text "Soccer was successfully updated"
    click_on "Back"
  end

  test "destroying a Soccer" do
    visit soccers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Soccer was successfully destroyed"
  end
end
