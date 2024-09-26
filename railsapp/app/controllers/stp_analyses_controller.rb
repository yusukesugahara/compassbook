class StpAnalysesController < ApplicationController
  before_action :set_project
  before_action :set_stp_analysis, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def show
    if @stp_analysis.nil?
      redirect_to project_stp_analyses_path(@project), alert: 'STP分析が見つかりません。'
    end
  end

  def new
    @stp_analysis = StpAnalysis.new
  end

  def edit
  end

  def create
    @stp_analysis = @project.stp_analyses.build(stp_analysis_params)
    if @stp_analysis.save
      redirect_to project_stp_analysis_path(@project, @stp_analysis), notice: 'STP分析が作成されました。'
    else
      render :new
    end
  end

  def update
    @stp_analysis = StpAnalysis.find(params[:id])
    if @stp_analysis.update(stp_analysis_params)
      redirect_to project_stp_analysis_path(@project, @stp_analysis), notice: 'STP分析が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    if @stp_analysis.destroy
      redirect_to project_path(@project), notice: 'STP分析が削除されました。'
    else
      redirect_to project_path(@project), alert: 'STP分析の削除に失敗しました。'
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_stp_analysis
    @stp_analysis =  @project.stp_analyses.find(params[:id])
    if @stp_analysis.nil?
      redirect_to project_stp_analyses_path(@project), alert: 'STP分析が見つかりません。'
    end
  end

  def stp_analysis_params
    params.require(:stp_analysis).permit(:segmentation, :targeting, :positioning, :memo)
  end

  def handle_record_not_found
    redirect_to root_path, alert: 'PEST分析が見つかりませんでした。'
  end
end

