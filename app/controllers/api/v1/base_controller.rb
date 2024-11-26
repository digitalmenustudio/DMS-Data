class Api::V1::BaseController < ApplicationController
    # Skip the default user authentication for API, we use API key here
    skip_before_action :authenticate_user!
    skip_after_action :verify_authorized, only: :index
    skip_after_action :verify_policy_scoped, only: :index
  
    # before_action :validate_api_key
    before_action :set_restaurant
  
    private
  
    def validate_api_key
      api_key = request.headers['X-Api-Key']
      if api_key.blank? || api_key != ENV.fetch('API_KEY')
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    end
  
    # This method sets the restaurant based on the restaurant_id sent in the request
    def set_restaurant
      sku = params[:sku]
      @restaurant = Restaurant.find_by(sku: sku)
  
      if @restaurant.nil?
        render json: { error: 'Restaurant not found or not authorized' }, status: :forbidden
      end
    end
  end
  