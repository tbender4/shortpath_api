require "test_helper"

class BuildingAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @building_account = building_accounts(:one)
  end

  test "should get index" do
    get building_accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_building_account_url
    assert_response :success
  end

  test "should create building_account" do
    assert_difference("BuildingAccount.count") do
      post building_accounts_url, params: { building_account: { building_id: @building_account.building_id } }
    end

    assert_redirected_to building_account_url(BuildingAccount.last)
  end

  test "should show building_account" do
    get building_account_url(@building_account)
    assert_response :success
  end

  test "should get edit" do
    get edit_building_account_url(@building_account)
    assert_response :success
  end

  test "should update building_account" do
    patch building_account_url(@building_account), params: { building_account: { building_id: @building_account.building_id } }
    assert_redirected_to building_account_url(@building_account)
  end

  test "should destroy building_account" do
    assert_difference("BuildingAccount.count", -1) do
      delete building_account_url(@building_account)
    end

    assert_redirected_to building_accounts_url
  end
end
