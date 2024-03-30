require "test_helper"

class LocationablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @locationable = locationables(:one)
  end

  test "should get index" do
    get locationables_url
    assert_response :success
  end

  test "should get new" do
    get new_locationable_url
    assert_response :success
  end

  test "should create locationable" do
    assert_difference("Locationable.count") do
      post locationables_url, params: { locationable: {  } }
    end

    assert_redirected_to locationable_url(Locationable.last)
  end

  test "should show locationable" do
    get locationable_url(@locationable)
    assert_response :success
  end

  test "should get edit" do
    get edit_locationable_url(@locationable)
    assert_response :success
  end

  test "should update locationable" do
    patch locationable_url(@locationable), params: { locationable: {  } }
    assert_redirected_to locationable_url(@locationable)
  end

  test "should destroy locationable" do
    assert_difference("Locationable.count", -1) do
      delete locationable_url(@locationable)
    end

    assert_redirected_to locationables_url
  end
end
