require "test_helper"

class BusinessModelCanvasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @business_model_canva = business_model_canvas(:one)
  end

  test "should get index" do
    get business_model_canvas_url
    assert_response :success
  end

  test "should get new" do
    get new_business_model_canva_url
    assert_response :success
  end

  test "should create business_model_canva" do
    assert_difference("BusinessModelCanva.count") do
      post business_model_canvas_url, params: { business_model_canva: {} }
    end

    assert_redirected_to business_model_canva_url(BusinessModelCanva.last)
  end

  test "should show business_model_canva" do
    get business_model_canva_url(@business_model_canva)
    assert_response :success
  end

  test "should get edit" do
    get edit_business_model_canva_url(@business_model_canva)
    assert_response :success
  end

  test "should update business_model_canva" do
    patch business_model_canva_url(@business_model_canva), params: { business_model_canva: {} }
    assert_redirected_to business_model_canva_url(@business_model_canva)
  end

  test "should destroy business_model_canva" do
    assert_difference("BusinessModelCanva.count", -1) do
      delete business_model_canva_url(@business_model_canva)
    end

    assert_redirected_to business_model_canvas_url
  end
end
