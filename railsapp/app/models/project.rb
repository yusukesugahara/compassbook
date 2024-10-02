class Project < ApplicationRecord
  belongs_to :user
  has_many :pest_analyses, class_name: 'PestAnalysis', dependent: :destroy
  has_many :three_c_analyses, dependent: :destroy
  has_many :stp_analyses, dependent: :destroy
  has_many :four_p_analyses, dependent: :destroy
  has_many :business_model_canvases, class_name: 'BusinessModelCanvas', dependent: :destroy
  has_many :swot_analysis, dependent: :destroy
  has_many :five_f_analysis, dependent: :destroy
  has_many :six_question, dependent: :destroy
  has_many :memo, dependent: :destroy
end
  