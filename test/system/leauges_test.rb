require "application_system_test_case"

class LeaugesTest < ApplicationSystemTestCase
  setup do
    @leauge = leauges(:one)
  end

  test "visiting the index" do
    visit leauges_url
    assert_selector "h1", text: "Leauges"
  end

  test "creating a Leauge" do
    visit leauges_url
    click_on "New Leauge"

    click_on "Create Leauge"

    assert_text "Leauge was successfully created"
    click_on "Back"
  end

  test "updating a Leauge" do
    visit leauges_url
    click_on "Edit", match: :first

    click_on "Update Leauge"

    assert_text "Leauge was successfully updated"
    click_on "Back"
  end

  test "destroying a Leauge" do
    visit leauges_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Leauge was successfully destroyed"
  end
end
