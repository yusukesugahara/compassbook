class FiveFAnalysesController < ApplicationController
  before_action :set_project
  before_action :set_five_f_analysis, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def show
    if @five_f_analysis.nil?
      redirect_to project_five_f_analyses_path(@project), alert: '5F分析が見つかりません。'
    end
  end

  def new
    @five_f_analysis = FiveFAnalysis.new
  end

  def create
    @five_f_analysis = @project.five_f_analyses.build(five_f_analysis_params)
    if @five_f_analysis.save
      redirect_to project_five_f_analysis_path(@project, @five_f_analysis), notice: '5F分析が作成されました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @five_f_analysis = FiveFAnalysis.find(params[:id])
    if @five_f_analysis.update(five_f_analysis_params)
      redirect_to project_five_f_analysis_path(@project, @five_f_analysis), notice: '5F分析が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    if @five_f_analysis.destroy
      redirect_to project_path(@project), notice: '5F分析が削除されました。'
    else
      redirect_to project_path(@project), alert: '5F分析の削除に失敗しました。'
    end
  end
  
  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_five_f_analysis
    @five_f_analysis =  @project.five_f_analyses.find(params[:id])
    if @five_f_analysis.nil?
      redirect_to project_five_f_analyses_path(@project), alert: 'five_f分析が見つかりません。'
    end
  end

  def five_f_analysis_params
    params.require(:five_f_analysis).permit(:threat_of_new_entrants, :bargaining_power_of_suppliers, :bargaining_power_of_buyers, :threat_of_substitutes, :competitive_rivalry, :memo)
  end

  def handle_record_not_found
    redirect_to root_path, alert: 'five_f分析が見つかりませんでした。'
  end
end

