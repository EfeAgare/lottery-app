class AddLotteryDrawIdToUserLottery < ActiveRecord::Migration[6.1]
  def change
    add_reference :user_lotteries, :lottery_draw, foreign_key: true
  end
end
