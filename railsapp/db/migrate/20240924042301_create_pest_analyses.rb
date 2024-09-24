class CreatePestAnalyses < ActiveRecord::Migration[7.2]
  def change
    create_table :pest_analyses do |t|
      t.references :project, null: false, foreign_key: true
      t.text :political_factors
      t.text :economic_factors
      t.text :social_factors
      t.text :technological_factors
      t.text :memo
      t.timestamps null: false
    end
  end
end
