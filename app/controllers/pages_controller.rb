class PagesController < ApplicationController
  before_action -> { authorize :pages }

  def home
    skip_policy_scope
  end
end
