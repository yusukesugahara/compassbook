class FourPAnalysesController < ApplicationController
  before_action :set_project
  before_action :set_four_p_analysis, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def show
    if @four_p_analysis.nil?
      redirect_to project_four_p_analyses_path(@project), alert: '4P分析が見つかりません。'
    end
  end

  def new
    @four_p_analysis = FourPAnalysis.new
  end

  def edit
  end

  def create
    @four_p_analysis = @project.four_p_analyses.build(four_p_analysis_params)
    if @four_p_analysis.save
      redirect_to project_four_p_analysis_path(@project, @four_p_analysis), notice: '4P分析が作成されました。'
    else
      render :new
    end
  end

  def update
    @four_p_analysis = FourPAnalysis.find(params[:id])
    if @four_p_analysis.update(four_p_analysis_params)
      redirect_to project_four_p_analysis_path(@project, @four_p_analysis), notice: '4P分析が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    if @four_p_analysis.destroy
      redirect_to project_path(@project), notice: '4P分析が削除されました。'
    else
      redirect_to project_path(@project), alert: '4P分析の削除に失敗しました。'
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_four_p_analysis
    @four_p_analysis =  @project.four_p_analyses.find(params[:id])
    if @four_p_analysis.nil?
      redirect_to project_four_p_analyses_path(@project), alert: '4P分析が見つかりません。'
    end
  end

  def four_p_analysis_params
    params.require(:four_p_analysis).permit(:product, :price, :place, :promotion, :memo)
  end
  
  def handle_record_not_found
    redirect_to root_path, alert: 'PEST分析が見つかりませんでした。'
  end

end
