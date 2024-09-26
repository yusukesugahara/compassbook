require "test_helper"

class ThreeCAnalysesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @three_c_analysis = three_c_analyses(:one)
  end

  test "should get index" do
    get three_c_analyses_url
    assert_response :success
  end

  test "should get new" do
    get new_three_c_analysis_url
    assert_response :success
  end

  test "should create three_c_analysis" do
    assert_difference("ThreeCAnalysis.count") do
      post three_c_analyses_url, params: { three_c_analysis: {} }
    end

    assert_redirected_to three_c_analysis_url(ThreeCAnalysis.last)
  end

  test "should show three_c_analysis" do
    get three_c_analysis_url(@three_c_analysis)
    assert_response :success
  end

  test "should get edit" do
    get edit_three_c_analysis_url(@three_c_analysis)
    assert_response :success
  end

  test "should update three_c_analysis" do
    patch three_c_analysis_url(@three_c_analysis), params: { three_c_analysis: {} }
    assert_redirected_to three_c_analysis_url(@three_c_analysis)
  end

  test "should destroy three_c_analysis" do
    assert_difference("ThreeCAnalysis.count", -1) do
      delete three_c_analysis_url(@three_c_analysis)
    end

    assert_redirected_to three_c_analyses_url
  end
end
