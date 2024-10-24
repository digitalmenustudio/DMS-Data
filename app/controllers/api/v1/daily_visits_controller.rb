class Api::V1::DailyVisitsController < Api::V1::BaseController
    def index
      # Fetch all items for the restaurant set in BaseController
      @daily_visits = @restaurant.daily_visits
  
      # Jbuilder will handle rendering the response
      render :index, formats: :json
    end
  end
  