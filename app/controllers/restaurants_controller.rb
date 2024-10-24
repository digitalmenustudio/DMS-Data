
class RestaurantsController < ApplicationController

  before_action :set_restaurant, only: %i[edit update show upload_data destroy]
  before_action -> { authorize @restaurant || Restaurant }

  decorates_assigned :restaurant, :restaurants
  add_controller_helpers :restaurants, only: :index

  def index
    @restaurants = policy_scope(Restaurant).order(:launch_date)
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(permitted_attributes(Restaurant))

    if @restaurant.save
      redirect_to @restaurant, notice: create_successful_notice
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @restaurant.assign_attributes(restaurant_params)

    if @restaurant.save
      redirect_to restaurants_path, notice: update_successful_notice
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def upload_data
    if params[:file].present? && params[:day]
      begin
        # Pass the file and the restaurant to a service for handling
        UploadDataServices::CsvUpload.new(restaurant: @restaurant, file: params[:file], day: params[:day]).run!
        redirect_to restaurants_path, notice: 'CSV data successfully uploaded.'
      rescue => e
        # Handle any errors during processing and redirect back with an alert
        redirect_to restaurants_path, alert: "Failed to upload CSV data: #{e.message}"
      end
    else
      redirect_to restaurants_path, alert: 'Please upload a valid CSV file.'
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, notice: destroy_successful_notice
  end

  private

  def set_restaurant
    @restaurant = policy_scope(Restaurant).find(params[:id])
  end

  def restaurant_params
    permitted_attributes(Restaurant)
  end
end

