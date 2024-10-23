class ApplicationController < ActionController::Base
    include Pundit::Authorization
    include NoticeHelper
    include LocaleHelper
    
    before_action :authenticate_user!
    after_action :verify_authorized, unless: :devise_controller?
    after_action :verify_policy_scoped, except: %i[new create destroy]
end
