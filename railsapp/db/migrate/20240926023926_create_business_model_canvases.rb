class CreateBusinessModelCanvases < ActiveRecord::Migration[7.2]
  def change
    create_table :business_model_canvases do |t|
      t.references :project, null: false, foreign_key: true
      t.text :key_partners
      t.text :key_activities
      t.text :key_resources
      t.text :value_propositions
      t.text :customer_relationships
      t.text :channels
      t.text :customer_segments
      t.text :cost_structure
      t.text :revenue_streams
      t.text :memo
      t.timestamps null: false
    end
  end
end