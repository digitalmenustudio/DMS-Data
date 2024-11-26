class Insight < ApplicationRecord
    belongs_to :restaurant

    has_rich_text :content
  end
  