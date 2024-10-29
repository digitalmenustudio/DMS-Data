class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.date :launch_date
      t.string :sku
      t.integer :total_visitors
      t.string :average_time

      t.timestamps
    end
  end
end
