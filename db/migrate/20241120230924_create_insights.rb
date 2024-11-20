class CreateInsights < ActiveRecord::Migration[7.0]
  def change
    create_table :insights do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.text :description, null: false
      t.string :title

      t.timestamps
    end
  end
end
