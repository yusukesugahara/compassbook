class Project < ApplicationRecord
    belongs_to :user
    has_many :pest_analyses, class_name: 'PestAnalysis', dependent: :destroy
  end
  