require "application_system_test_case"

class BuildingAccountsTest < ApplicationSystemTestCase
  setup do
    @building_account = building_accounts(:one)
  end

  test "visiting the index" do
    visit building_accounts_url
    assert_selector "h1", text: "Building accounts"
  end

  test "should create building account" do
    visit building_accounts_url
    click_on "New building account"

    fill_in "Building", with: @building_account.building_id
    click_on "Create Building account"

    assert_text "Building account was successfully created"
    click_on "Back"
  end

  test "should update Building account" do
    visit building_account_url(@building_account)
    click_on "Edit this building account", match: :first

    fill_in "Building", with: @building_account.building_id
    click_on "Update Building account"

    assert_text "Building account was successfully updated"
    click_on "Back"
  end

  test "should destroy Building account" do
    visit building_account_url(@building_account)
    click_on "Destroy this building account", match: :first

    assert_text "Building account was successfully destroyed"
  end
end
