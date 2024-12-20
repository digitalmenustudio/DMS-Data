class DailyVisit < ApplicationRecord
    belongs_to :restaurant
    
    validates :date, presence: true, uniqueness: { scope: :restaurant_id, message: "Date déjà utilisé" }
    validates :first_time_visitors, :recurring_visitors, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
    validates :minutes, numericality: { greater_than_or_equal_to: 0 }
    validates :seconds, numericality: { greater_than_or_equal_to: 0, less_than: 60 }
end
  