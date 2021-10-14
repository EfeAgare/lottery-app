class UserLotteryController < ApplicationController
  before_action :auth_user, only: %i[create]

  def create
    return if user_lottery.last&.in_progress?

    @lottery_number = user_lottery.create(user_lottery_params)

    respond_to do |format|
      format.json { head :ok }
    end
  end

  def index
    @user_lottery = user_lottery
  end

  private

  def user_lottery_params
    params.permit(:lottery_number, :draw_status)
  end

  def user_lottery
    current_user.user_lotteries
  end
end