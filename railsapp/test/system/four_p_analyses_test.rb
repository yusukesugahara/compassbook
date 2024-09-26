require "application_system_test_case"

class FourPAnalysesTest < ApplicationSystemTestCase
  setup do
    @four_p_analysis = four_p_analyses(:one)
  end

  test "visiting the index" do
    visit four_p_analyses_url
    assert_selector "h1", text: "Four p analyses"
  end

  test "should create four p analysis" do
    visit four_p_analyses_url
    click_on "New four p analysis"

    click_on "Create Four p analysis"

    assert_text "Four p analysis was successfully created"
    click_on "Back"
  end

  test "should update Four p analysis" do
    visit four_p_analysis_url(@four_p_analysis)
    click_on "Edit this four p analysis", match: :first

    click_on "Update Four p analysis"

    assert_text "Four p analysis was successfully updated"
    click_on "Back"
  end

  test "should destroy Four p analysis" do
    visit four_p_analysis_url(@four_p_analysis)
    click_on "Destroy this four p analysis", match: :first

    assert_text "Four p analysis was successfully destroyed"
  end
end
