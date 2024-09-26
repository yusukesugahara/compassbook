class CreateFourPAnalyses < ActiveRecord::Migration[7.2]
  def change
    create_table :four_p_analyses do |t|
      t.references :project, null: false, foreign_key: true
      t.text :product
      t.text :price
      t.text :place
      t.text :promotion
      t.text :memo
      t.timestamps null: false
    end
  end
end
