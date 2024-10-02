class SwotAnalysesController < ApplicationController
  before_action :set_project
  before_action :set_swot_analysis, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def show
    if @swot_analysis.nil?
      redirect_to project_swot_analyses_path(@project), alert: 'SWOT分析が見つかりません。'
    end
  end

  def new
    @swot_analysis = SwotAnalysis.new
  end

  def create
    @swot_analysis = @project.swot_analyses.build(swot_analysis_params)
    if @swot_analysis.save
      redirect_to project_swot_analysis_path(@project, @swot_analysis), notice: 'SWOT分析が作成されました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @swot_analysis = SwotAnalysis.find(params[:id])
    if @swot_analysis.update(swot_analysis_params)
      redirect_to project_swot_analysis_path(@project, @swot_analysis), notice: 'SWOT分析が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    if @swot_analysis.destroy
      redirect_to project_path(@project), notice: 'SWOT分析が削除されました。'
    else
      redirect_to project_path(@project), alert: 'SWOT分析の削除に失敗しました。'
    end
  end
  
  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_swot_analysis
    @swot_analysis =  @project.swot_analyses.find(params[:id])
    if @swot_analysis.nil?
      redirect_to project_swot_analyses_path(@project), alert: 'SWOT分析が見つかりません。'
    end
  end

  def swot_analysis_params
    params.require(:swot_analysis).permit(:strengths, :weaknesses, :opportunities, :threats, :memo)
  end

  def handle_record_not_found
    redirect_to root_path, alert: 'SWOT分析が見つかりませんでした。'
  end
end

