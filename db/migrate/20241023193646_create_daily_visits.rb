class CreateDailyVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :daily_visits do |t|
      t.references :restaurant, null: false, foreign_key: true, index: true
      t.date :date, null: false, index: true
      t.string :weekday, null: false
      t.integer :first_time_visitors, null: false, default: 0
      t.integer :recurring_visitors, null: false, default: 0
      t.integer :minutes, default: 0, null: false
      t.integer :seconds, default: 0, null: false
      t.float :sales
      
      t.timestamps
    end
  end
end
