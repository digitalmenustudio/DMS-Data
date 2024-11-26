class InsightPolicy < ApplicationPolicy
  include AdminRestaurantScopedPolicy

  def permitted_attributes
    %i[title description content]
  end
end
