class PestAnalysesController < ApplicationController
  before_action :set_project
  before_action :set_pest_analysis, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def show
    if @pest_analysis.nil?
      redirect_to project_pest_analyses_path(@project), alert: 'PEST分析が見つかりません。'
    end
  end

  def new
    @pest_analysis = PestAnalysis.new
  end

  def create
    @pest_analysis = @project.pest_analyses.build(pest_analysis_params)
    if @pest_analysis.save
      redirect_to project_pest_analysis_path(@project, @pest_analysis), notice: 'PEST分析が作成されました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @pest_analysis = PestAnalysis.find(params[:id])
    if @pest_analysis.update(pest_analysis_params)
      redirect_to project_pest_analysis_path(@project, @pest_analysis), notice: 'PEST分析が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    if @pest_analysis.destroy
      redirect_to project_path(@project), notice: 'PEST分析が削除されました。'
    else
      redirect_to project_path(@project), alert: 'PEST分析の削除に失敗しました。'
    end
  end
  
  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_pest_analysis
    @pest_analysis =  @project.pest_analyses.find(params[:id])
    if @pest_analysis.nil?
      redirect_to project_pest_analyses_path(@project), alert: 'PEST分析が見つかりません。'
    end
  end

  def pest_analysis_params
    params.require(:pest_analysis).permit(:political_factors, :economic_factors, :social_factors, :technological_factors, :memo)
  end

  def handle_record_not_found
    redirect_to root_path, alert: 'PEST分析が見つかりませんでした。'
  end
end
