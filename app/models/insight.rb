class Insight < ApplicationRecord
    belongs_to :restaurant
  
    # Validations
    validates :description, presence: true, length: { maximum: 1500 }
  end
  