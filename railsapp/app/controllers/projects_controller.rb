class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      redirect_to @project, notice: 'プロジェクトが作成されました。'
    else
      render :new
    end
  end

  def show
    @pest_analyses = @project.pest_analyses
    @three_c_analyses = @project.three_c_analyses
    @stp_analyses = @project.stp_analyses
    @four_p_analyses = @project.four_p_analyses
    @business_model_canvases = @project.business_model_canvases
    @swot_analyses = @project.swot_analyses
    @five_f_analyses = @project.five_f_analyses
    @six_questions = @project.six_questions
    @memos = @project.memos
  end

  def edit

  end

  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'プロジェクトが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    if @project.destroy
      redirect_to root_path, notice: 'プロジェクトが削除されました。'
    else
      redirect_to root_path, alert: 'プロジェクトの削除に失敗しました。'
    end
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end

  def handle_record_not_found
    redirect_to root_path, alert: 'プロジェクトが見つかりませんでした。'
  end
end
