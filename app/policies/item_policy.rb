class ItemPolicy < ApplicationPolicy
  include AdminRestaurantScopedPolicy

  def permitted_attributes
    %i[name item_type clicks likes title]
  end
end

