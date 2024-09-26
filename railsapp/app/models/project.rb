class Project < ApplicationRecord
  belongs_to :user
  has_many :pest_analyses, class_name: 'PestAnalysis', dependent: :destroy
  has_many :three_c_analyses, dependent: :destroy
  has_many :stp_analyses, dependent: :destroy
  has_many :four_p_analyses, dependent: :destroy
  has_many :business_model_canvases, class_name: 'BusinessModelCanvas', dependent: :destroy
end
  