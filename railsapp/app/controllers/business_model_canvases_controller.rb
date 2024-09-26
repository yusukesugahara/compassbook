class BusinessModelCanvasesController < ApplicationController
  before_action :set_project
  before_action :set_business_model_canvas, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def show
    if @business_model_canvas.nil?
      redirect_to project_business_model_canvases_path(@project), alert: 'ビジネスモデルキャンバスが見つかりません。'
    end
  end

  def new
    @business_model_canvas = BusinessModelCanvas.new
  end

  def create
    @business_model_canvas  = @project.business_model_canvases.build(business_model_canvas_params)
    if @business_model_canvas .save
      redirect_to project_business_model_canvas_path(@project, @business_model_canvas), notice: 'ビジネスモデルキャンバスが作成されました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @business_model_canvas = BusinessModelCanvas.find(params[:id])
    if @business_model_canvas.update(business_model_canvas_params)
      redirect_to project_business_model_canvas_path(@project, @business_model_canvas), notice: 'ビジネスモデルキャンバスが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    if @business_model_canvas.destroy
      redirect_to project_path(@project), notice: 'ビジネスモデルキャンバス分析が削除されました。'
    else
      redirect_to project_path(@project), alert: 'ビジネスモデルキャンバス分析の削除に失敗しました。'
    end
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_business_model_canvas
    @business_model_canvas = @project.business_model_canvases.find(params[:id])
    if @business_model_canvas.nil?
      redirect_to project_business_model_canvases_path(@project), alert: 'ビジネスモデルキャンバスが見つかりません。'
    end
  end

  def business_model_canvas_params
    params.require(:business_model_canvas).permit(:key_partners, :key_activities, :key_resources, :value_propositions, :customer_relationships, :channels, :customer_segments, :cost_structure, :revenue_streams, :memo)
  end

  def handle_record_not_found
    redirect_to root_path, alert: 'ビジネスモデルキャンバス分析が見つかりませんでした。'
  end
end

