class MemosController < ApplicationController
  before_action :set_project
  before_action :set_memo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def show
    if @memo.nil?
      redirect_to project_pest_analyses_path(@project), alert: 'メモが見つかりません。'
    end
  end

  def new
    @memo = Memo.new
  end

  def create
    @memo = @project.memos.build(memo_params)
    if @memo.save
      redirect_to project_memo_path(@project, @memo), notice: 'メモが作成されました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @memo = Memo.find(params[:id])
    if @memo.update(memo_params)
      redirect_to project_memo_path(@project, @memo), notice: 'メモが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    if @memo.destroy
      redirect_to project_path(@project), notice: 'メモが削除されました。'
    else
      redirect_to project_path(@project), alert: 'メモの削除に失敗しました。'
    end
  end
  
  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_memo
    @memo =  @project.memos.find(params[:id])
    if @memo.nil?
      redirect_to project_memo_path(@project), alert: 'メモが見つかりません。'
    end
  end

  def memo_params
    params.require(:memo).permit(:memo)
  end

  def handle_record_not_found
    redirect_to root_path, alert: 'メモが見つかりませんでした。'
  end
end
