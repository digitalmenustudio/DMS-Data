class RestaurantPolicy < ApplicationPolicy
  include AdminBasePolicy

  def upload_data?
    user && user.restaurant_id == record.id
  end

  def permitted_attributes
    %i[name launch_date sku total_visitors average_time]
  end
end

