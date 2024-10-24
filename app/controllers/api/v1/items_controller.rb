class Api::V1::ItemsController < Api::V1::BaseController
    def index
      # Fetch all items for the restaurant set in BaseController
      @items = @restaurant.items
  
      # Jbuilder will handle rendering the response
      render :index, formats: :json
    end
  end
  