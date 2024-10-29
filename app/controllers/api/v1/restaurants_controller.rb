class Api::V1::RestaurantsController < Api::V1::BaseController
    def index
      # Jbuilder will handle rendering the response
      render :index, formats: :json
    end
  end
  