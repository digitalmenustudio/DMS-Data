class Api::V1::InsightsController < Api::V1::BaseController
    def index
      # Fetch all insights for the restaurant set in BaseController
      @insights = @restaurant.insights
  
      # Jbuilder will handle rendering the response
      render :index, formats: :json
    end
  end
  