class PagesController < ApplicationController
  before_action -> { authorize :pages }

  def home
  end
end
