class ApplicationController < ActionController::Base
  def index
    @lists = List.all
    render :index
  end
end
