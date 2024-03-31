require "test_helper"

class GroupContactsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_contact = group_contacts(:one)
  end

  test "should get index" do
    get group_contacts_url
    assert_response :success
  end

  test "should get new" do
    get new_group_contact_url
    assert_response :success
  end

  test "should create group_contact" do
    assert_difference("GroupContact.count") do
      post group_contacts_url, params: { group_contact: { contact_id: @group_contact.contact_id, group_id: @group_contact.group_id } }
    end

    assert_redirected_to group_contact_url(GroupContact.last)
  end

  test "should show group_contact" do
    get group_contact_url(@group_contact)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_contact_url(@group_contact)
    assert_response :success
  end

  test "should update group_contact" do
    patch group_contact_url(@group_contact), params: { group_contact: { contact_id: @group_contact.contact_id, group_id: @group_contact.group_id } }
    assert_redirected_to group_contact_url(@group_contact)
  end

  test "should destroy group_contact" do
    assert_difference("GroupContact.count", -1) do
      delete group_contact_url(@group_contact)
    end

    assert_redirected_to group_contacts_url
  end
end
