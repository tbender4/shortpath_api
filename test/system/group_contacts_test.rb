require "application_system_test_case"

class GroupContactsTest < ApplicationSystemTestCase
  setup do
    @group_contact = group_contacts(:one)
  end

  test "visiting the index" do
    visit group_contacts_url
    assert_selector "h1", text: "Group contacts"
  end

  test "should create group contact" do
    visit group_contacts_url
    click_on "New group contact"

    fill_in "Contact", with: @group_contact.contact_id
    fill_in "Group", with: @group_contact.group_id
    click_on "Create Group contact"

    assert_text "Group contact was successfully created"
    click_on "Back"
  end

  test "should update Group contact" do
    visit group_contact_url(@group_contact)
    click_on "Edit this group contact", match: :first

    fill_in "Contact", with: @group_contact.contact_id
    fill_in "Group", with: @group_contact.group_id
    click_on "Update Group contact"

    assert_text "Group contact was successfully updated"
    click_on "Back"
  end

  test "should destroy Group contact" do
    visit group_contact_url(@group_contact)
    click_on "Destroy this group contact", match: :first

    assert_text "Group contact was successfully destroyed"
  end
end
