require "application_system_test_case"

class VisitorTypesTest < ApplicationSystemTestCase
  setup do
    @visitor_type = visitor_types(:one)
  end

  test "visiting the index" do
    visit visitor_types_url
    assert_selector "h1", text: "Visitor types"
  end

  test "should create visitor type" do
    visit visitor_types_url
    click_on "New visitor type"

    fill_in "Building", with: @visitor_type.building_id
    fill_in "Category", with: @visitor_type.category
    check "Hide barcode" if @visitor_type.hide_barcode
    fill_in "Name", with: @visitor_type.name
    click_on "Create Visitor type"

    assert_text "Visitor type was successfully created"
    click_on "Back"
  end

  test "should update Visitor type" do
    visit visitor_type_url(@visitor_type)
    click_on "Edit this visitor type", match: :first

    fill_in "Building", with: @visitor_type.building_id
    fill_in "Category", with: @visitor_type.category
    check "Hide barcode" if @visitor_type.hide_barcode
    fill_in "Name", with: @visitor_type.name
    click_on "Update Visitor type"

    assert_text "Visitor type was successfully updated"
    click_on "Back"
  end

  test "should destroy Visitor type" do
    visit visitor_type_url(@visitor_type)
    click_on "Destroy this visitor type", match: :first

    assert_text "Visitor type was successfully destroyed"
  end
end
