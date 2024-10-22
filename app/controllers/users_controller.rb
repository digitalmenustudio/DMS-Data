class UsersController < ApplicationController
  before_action :set_user, only: %i[edit update show destroy]
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

  private

  def set_user
    @user = policy_scope(User).find(params[:id])
  end
end
