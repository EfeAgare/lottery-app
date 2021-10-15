class FinishLotteryDrawJob < ApplicationJob
  queue_as :default

  def perform
    finish_lotteries
  end

  private

  def finish_lotteries
    @lotteries = UserLottery.where(draw_status: 1)

    return if last_draw.blank?

    unless @lotteries.any?
      end_current_draw_if_no_user
      return
    end

    # get the lotteries length
    lotteries_lenght = @lotteries.length
    # generate a winner user Id from the length
    user_id_index    = LotteryNumber::Generator.new(1..lotteries_lenght).pick
    user_ids         =  @lotteries.pluck(:user_id)
    index = user_id_index.join.to_i - 1

    # use the user Id to get a winner
    lottery_winner = @lotteries.find_by(user_id: user_ids[index])

    lottery_winner.update(status: 1, draw_status: 2, lottery_draw_id: last_draw.id)

    # update other users lotteries
    @lotteries.in_batches do |relation|
      relation.update(status: 2, draw_status: 2, lottery_draw_id: last_draw.id)
    end

    last_draw.update(lottery_number: lottery_winner.lottery_number)
  end


  def end_current_draw_if_no_user
    last_draw.update(lottery_number: LotteryNumber::Generator.new.pick_winner.join(","))
  end

  def last_draw
    last_draw = LotteryDraw.last
  end
end
