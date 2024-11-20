class InsightsController < ApplicationController
    before_action :set_restaurant
    before_action :set_insight, only: %i[edit update show destroy]
    before_action -> { authorize @insight || Insight }
  
    decorates_assigned :insight, :insights
    add_controller_helpers :insights, only: :index
  
    def index
      @insights = policy_scope(Insight).where(restaurant: @restaurant).order(created_at: :desc)
    end
  
    def show
    end
  
    def new
      @insight = @restaurant.insights.new
    end
  
    def edit
    end
  
    def create
      @insight = @restaurant.insights.new(insight_params)
  
      if @insight.save
        redirect_to insights_path, notice: create_successful_notice
      else
        render :new, status: :unprocessable_entity
      end
    end
  
    def update
      @insight.assign_attributes(insight_params)
  
      if @insight.save
        redirect_to insights_path, notice: update_successful_notice
      else
        render :edit, status: :unprocessable_entity
      end
    end
  
    def destroy
      @insight.destroy
      redirect_to insights_path, notice: destroy_successful_notice
    end
  
    private
  
    def set_restaurant
      @restaurant = Restaurant.find(current_user.restaurant_id)
    end
  
    def set_insight
      @insight = policy_scope(@restaurant.insights).find(params[:id])
    end
  
    def insight_params
      permitted_attributes(Insight)
    end
  end
  