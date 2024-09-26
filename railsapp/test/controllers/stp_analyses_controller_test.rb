require "test_helper"

class StpAnalysesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stp_analysis = stp_analyses(:one)
  end

  test "should get index" do
    get stp_analyses_url
    assert_response :success
  end

  test "should get new" do
    get new_stp_analysis_url
    assert_response :success
  end

  test "should create stp_analysis" do
    assert_difference("StpAnalysis.count") do
      post stp_analyses_url, params: { stp_analysis: {} }
    end

    assert_redirected_to stp_analysis_url(StpAnalysis.last)
  end

  test "should show stp_analysis" do
    get stp_analysis_url(@stp_analysis)
    assert_response :success
  end

  test "should get edit" do
    get edit_stp_analysis_url(@stp_analysis)
    assert_response :success
  end

  test "should update stp_analysis" do
    patch stp_analysis_url(@stp_analysis), params: { stp_analysis: {} }
    assert_redirected_to stp_analysis_url(@stp_analysis)
  end

  test "should destroy stp_analysis" do
    assert_difference("StpAnalysis.count", -1) do
      delete stp_analysis_url(@stp_analysis)
    end

    assert_redirected_to stp_analyses_url
  end
end
