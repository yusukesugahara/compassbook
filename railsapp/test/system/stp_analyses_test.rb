require "application_system_test_case"

class StpAnalysesTest < ApplicationSystemTestCase
  setup do
    @stp_analysis = stp_analyses(:one)
  end

  test "visiting the index" do
    visit stp_analyses_url
    assert_selector "h1", text: "Stp analyses"
  end

  test "should create stp analysis" do
    visit stp_analyses_url
    click_on "New stp analysis"

    click_on "Create Stp analysis"

    assert_text "Stp analysis was successfully created"
    click_on "Back"
  end

  test "should update Stp analysis" do
    visit stp_analysis_url(@stp_analysis)
    click_on "Edit this stp analysis", match: :first

    click_on "Update Stp analysis"

    assert_text "Stp analysis was successfully updated"
    click_on "Back"
  end

  test "should destroy Stp analysis" do
    visit stp_analysis_url(@stp_analysis)
    click_on "Destroy this stp analysis", match: :first

    assert_text "Stp analysis was successfully destroyed"
  end
end
