require "application_system_test_case"

class BusinessModelCanvasTest < ApplicationSystemTestCase
  setup do
    @business_model_canva = business_model_canvas(:one)
  end

  test "visiting the index" do
    visit business_model_canvas_url
    assert_selector "h1", text: "Business model canvas"
  end

  test "should create business model canva" do
    visit business_model_canvas_url
    click_on "New business model canva"

    click_on "Create Business model canva"

    assert_text "Business model canva was successfully created"
    click_on "Back"
  end

  test "should update Business model canva" do
    visit business_model_canva_url(@business_model_canva)
    click_on "Edit this business model canva", match: :first

    click_on "Update Business model canva"

    assert_text "Business model canva was successfully updated"
    click_on "Back"
  end

  test "should destroy Business model canva" do
    visit business_model_canva_url(@business_model_canva)
    click_on "Destroy this business model canva", match: :first

    assert_text "Business model canva was successfully destroyed"
  end
end
