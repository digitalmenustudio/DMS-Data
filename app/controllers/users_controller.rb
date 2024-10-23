class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show destroy switch_restaurant]
  before_action -> { authorize @user || User }

  decorates_assigned :user, :users
  add_controller_helpers :users, only: :index

  def index
    @users = policy_scope(User).order(:email)
  end

  def show
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: destroy_successful_notice
  end

  def switch_restaurant
    restaurant = Restaurant.find(params[:restaurant_id])
    
    if @user.update(restaurant_id: restaurant.id)
      redirect_to restaurants_path, notice: "Restaurant switched successfully."
    else
      redirect_to restaurants_path, alert: "Unable to switch restaurant."
    end
  end

  private

  def set_user
    @user = policy_scope(User).find(params[:id])
  end
end
