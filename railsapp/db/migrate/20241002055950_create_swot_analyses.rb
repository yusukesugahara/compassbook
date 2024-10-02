class CreateSwotAnalyses < ActiveRecord::Migration[7.2]
  def change
    create_table :swot_analyses do |t|
      t.references :project, null: false, foreign_key: true
      t.text :strengths
      t.text :weaknesses
      t.text :opportunities
      t.text :threats
      t.text :memo
      t.timestamps null: false
    end
  end
end
