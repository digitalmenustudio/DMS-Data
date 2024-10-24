class Api::V1::TabClicksController < Api::V1::BaseController
    def index
      # Fetch all items for the restaurant set in BaseController
      @tab_clicks = @restaurant.tab_clicks
  
      # Jbuilder will handle rendering the response
      render :index, formats: :json
    end
  end
  