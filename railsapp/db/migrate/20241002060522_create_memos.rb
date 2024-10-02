class CreateMemos < ActiveRecord::Migration[7.2]
  def change
    create_table :memos do |t|
      t.references :project, null: false, foreign_key: true
      t.text :memo
      t.timestamps null: false
    end
  end
end
