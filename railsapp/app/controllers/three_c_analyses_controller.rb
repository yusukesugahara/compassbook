class ThreeCAnalysesController < ApplicationController
  before_action :set_project
  before_action :set_three_c_analysis, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def show
    if @three_c_analysis.nil?
      redirect_to project_three_c_analysis_path(@project), alert: '3C分析が見つかりません。'
    end
  end

  def new
    @three_c_analysis = ThreeCAnalysis.new
  end

  def edit
  end

  def create
    @three_c_analysis = @project.three_c_analyses.build(three_c_analysis_params)
    if @three_c_analysis.save
      redirect_to project_three_c_analysis_path(@project, @three_c_analysis), notice: '3C分析が作成されました。'
    else
      render :new
    end
  end

  def update
    @three_c_analysis = ThreeCAnalysis.find(params[:id])
    if @three_c_analysis.update(three_c_analysis_params)
      redirect_to project_three_c_analysis_path(@project, @three_c_analysis), notice: '3C分析が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    if @three_c_analysis.destroy
      redirect_to project_path(@project), notice: '3C分析が削除されました。'
    else
      redirect_to project_path(@project), alert: '3C分析の削除に失敗しました。'
    end
  end

  private
  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_three_c_analysis
    @three_c_analysis = @project.three_c_analyses.find(params[:id])
    if @three_c_analysis.nil?
      redirect_to project_three_c_analyses_path(@project), alert: '3C分析が見つかりません。'
    end
  end

  def three_c_analysis_params
    params.require(:three_c_analysis).permit(:customer, :company, :competitor, :memo)
  end
  
  def handle_record_not_found
    redirect_to root_path, alert: '3C分析が見つかりませんでした。'
  end
end
