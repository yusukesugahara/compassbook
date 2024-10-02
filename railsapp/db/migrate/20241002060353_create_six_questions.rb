class CreateSixQuestions < ActiveRecord::Migration[7.2]
  def change
    create_table :six_questions do |t|
      t.references :project, null: false, foreign_key: true
      t.text :who
      t.text :problem
      t.text :solution
      t.text :existing_alternatives
      t.text :market_size
      t.text :purpose
      t.text :memo
      t.timestamps null: false
    end
  end
end
