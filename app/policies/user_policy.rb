class UserPolicy < ApplicationPolicy
  include AdminBasePolicy

  def switch_restaurant?
    user
  end
  
  def permitted_attributes
    %i[email password password_confirmation]
  end
end
