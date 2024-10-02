class SixQuestionsController < ApplicationController
  before_action :set_project
  before_action :set_six_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def show
    if @six_question.nil?
      redirect_to project_six_question_path(@project), alert: '6つの質問が見つかりません。'
    end
  end

  def new
    @six_question = SixQuestion.new
  end

  def create
    @six_question = @project.six_questions.build(six_question_params)
    if @six_question.save
      redirect_to project_six_question_path(@project, @six_question), notice: '6つの質問が作成されました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @six_question = SixQuestion.find(params[:id])
    if @six_question.update(six_question_params)
      redirect_to project_six_question_path(@project, @six_question), notice: '6つの質問が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    if @six_question.destroy
      redirect_to project_path(@project), notice: '6つの質問が削除されました。'
    else
      redirect_to project_path(@project), alert: '6つの質問の削除に失敗しました。'
    end
  end
  
  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_six_question
    @six_question =  @project.six_questions.find(params[:id])
    if @six_question.nil?
      redirect_to project_six_question_path(@project), alert: '6つの質問が見つかりません。'
    end
  end

  def six_question_params
    params.require(:six_question).permit(:who, :problem, :solution, :existing_alternatives, :market_size, :purpose, :memo)
  end

  def handle_record_not_found
    redirect_to root_path, alert: '6つの質問が見つかりませんでした。'
  end
end

