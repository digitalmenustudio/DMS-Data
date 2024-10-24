class Api::V1::MenuAccessLogsController < Api::V1::BaseController
    def index
      # Fetch all items for the restaurant set in BaseController
      @menu_access_logs = @restaurant.menu_access_logs
  
      # Jbuilder will handle rendering the response
      render :index, formats: :json
    end
  end
  