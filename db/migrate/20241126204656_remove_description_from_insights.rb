class RemoveDescriptionFromInsights < ActiveRecord::Migration[7.0]
  def change
    remove_column :insights, :description, :text
  end
end
