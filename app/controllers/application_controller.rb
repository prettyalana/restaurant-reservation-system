class ApplicationController < ActionController::Base
  before_action :set_search

  def set_search
  @q = Reservation.ransack(params[:q])
  end
end
