class UserPolicy < ApplicationPolicy
  include AdminBasePolicy

  def permitted_attributes
    %i[email password password_confirmation]
  end
end
