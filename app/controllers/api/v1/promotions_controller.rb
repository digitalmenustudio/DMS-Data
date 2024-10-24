class Api::V1::PromotionsController < Api::V1::BaseController
    def index
      # Fetch all items for the restaurant set in BaseController
      @promotions = @restaurant.promotions
  
      # Jbuilder will handle rendering the response
      render :index, formats: :json
    end
  end
  