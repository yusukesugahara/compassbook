class CreateStpAnalyses < ActiveRecord::Migration[7.2]
  def change
    create_table :stp_analyses do |t|
      t.references :project, null: false, foreign_key: true
      t.text :segmentation
      t.text :targeting
      t.text :positioning
      t.text :memo
      t.timestamps null: false
    end
  end
end