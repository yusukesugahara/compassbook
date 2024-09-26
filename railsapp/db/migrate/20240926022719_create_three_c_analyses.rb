class CreateThreeCAnalyses < ActiveRecord::Migration[7.2]
  def change
    create_table :three_c_analyses do |t|
      t.references :project, null: false, foreign_key: true
      t.text :customer
      t.text :company
      t.text :competitor
      t.text :memo
      t.timestamps null: false
    end
  end
end
