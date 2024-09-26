require "application_system_test_case"

class ThreeCAnalysesTest < ApplicationSystemTestCase
  setup do
    @three_c_analysis = three_c_analyses(:one)
  end

  test "visiting the index" do
    visit three_c_analyses_url
    assert_selector "h1", text: "Three c analyses"
  end

  test "should create three c analysis" do
    visit three_c_analyses_url
    click_on "New three c analysis"

    click_on "Create Three c analysis"

    assert_text "Three c analysis was successfully created"
    click_on "Back"
  end

  test "should update Three c analysis" do
    visit three_c_analysis_url(@three_c_analysis)
    click_on "Edit this three c analysis", match: :first

    click_on "Update Three c analysis"

    assert_text "Three c analysis was successfully updated"
    click_on "Back"
  end

  test "should destroy Three c analysis" do
    visit three_c_analysis_url(@three_c_analysis)
    click_on "Destroy this three c analysis", match: :first

    assert_text "Three c analysis was successfully destroyed"
  end
end
