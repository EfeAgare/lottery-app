class LotteryDrawController < ApplicationController
  before_action :has_lotteries

  def index
    @lottery_number = LotteryNumber::Generator.new.pick(6)
    @last_draw      = last_lottery_number
  
    respond_to do |format|
      format.js
      format.html
    end
  end

  private

  def has_lotteries
    return unless current_user

    @user_lottery = current_user.user_lotteries.last
  end

  def last_lottery_number
    LotteryDraw.with_lottery_number.last&.lottery_number
  end
end
