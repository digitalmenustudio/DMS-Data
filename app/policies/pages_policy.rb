class PagesPolicy < ApplicationPolicy
    def home?
        user
    end
end