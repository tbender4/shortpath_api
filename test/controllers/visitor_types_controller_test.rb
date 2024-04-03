require "test_helper"

class VisitorTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @visitor_type = visitor_types(:one)
  end

  test "should get index" do
    get visitor_types_url
    assert_response :success
  end

  test "should get new" do
    get new_visitor_type_url
    assert_response :success
  end

  test "should create visitor_type" do
    assert_difference("VisitorType.count") do
      post visitor_types_url, params: { visitor_type: { building_id: @visitor_type.building_id, category: @visitor_type.category, hide_barcode: @visitor_type.hide_barcode, name: @visitor_type.name } }
    end

    assert_redirected_to visitor_type_url(VisitorType.last)
  end

  test "should show visitor_type" do
    get visitor_type_url(@visitor_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_visitor_type_url(@visitor_type)
    assert_response :success
  end

  test "should update visitor_type" do
    patch visitor_type_url(@visitor_type), params: { visitor_type: { building_id: @visitor_type.building_id, category: @visitor_type.category, hide_barcode: @visitor_type.hide_barcode, name: @visitor_type.name } }
    assert_redirected_to visitor_type_url(@visitor_type)
  end

  test "should destroy visitor_type" do
    assert_difference("VisitorType.count", -1) do
      delete visitor_type_url(@visitor_type)
    end

    assert_redirected_to visitor_types_url
  end
end
