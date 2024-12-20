class Restaurant < ApplicationRecord

    searchable :name

    has_many :users, dependent: :destroy
    has_many :daily_visits, dependent: :destroy
    has_many :menu_access_logs, dependent: :destroy
    has_many :tab_clicks, dependent: :destroy
    has_many :items, dependent: :destroy
    has_many :promotions, dependent: :destroy
    has_many :insights, dependent: :destroy

    validates :launch_date, :name, :sku, presence: true
end
