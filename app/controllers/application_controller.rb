class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include CurrentLotteryDraw

  before_action :set_draw

  def auth_user
    redirect_to new_user_registration_url unless user_signed_in?
  end
end
