class CreateFiveFAnalyses < ActiveRecord::Migration[7.2]
  def change
    create_table :five_f_analyses do |t|
      t.references :project, null: false, foreign_key: true
      t.text :threat_of_new_entrants
      t.text :bargaining_power_of_suppliers
      t.text :bargaining_power_of_buyers
      t.text :threat_of_substitutes
      t.text :competitive_rivalry
      t.text :memo
      t.timestamps null: false
    end
  end
end
