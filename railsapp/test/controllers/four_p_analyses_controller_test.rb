require "test_helper"

class FourPAnalysesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @four_p_analysis = four_p_analyses(:one)
  end

  test "should get index" do
    get four_p_analyses_url
    assert_response :success
  end

  test "should get new" do
    get new_four_p_analysis_url
    assert_response :success
  end

  test "should create four_p_analysis" do
    assert_difference("FourPAnalysis.count") do
      post four_p_analyses_url, params: { four_p_analysis: {} }
    end

    assert_redirected_to four_p_analysis_url(FourPAnalysis.last)
  end

  test "should show four_p_analysis" do
    get four_p_analysis_url(@four_p_analysis)
    assert_response :success
  end

  test "should get edit" do
    get edit_four_p_analysis_url(@four_p_analysis)
    assert_response :success
  end

  test "should update four_p_analysis" do
    patch four_p_analysis_url(@four_p_analysis), params: { four_p_analysis: {} }
    assert_redirected_to four_p_analysis_url(@four_p_analysis)
  end

  test "should destroy four_p_analysis" do
    assert_difference("FourPAnalysis.count", -1) do
      delete four_p_analysis_url(@four_p_analysis)
    end

    assert_redirected_to four_p_analyses_url
  end
end
