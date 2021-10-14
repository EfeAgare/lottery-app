class CreateLotteryDraws < ActiveRecord::Migration[6.1]
  def change
    create_table :lottery_draws do |t|
      t.string :lottery_number
      t.timestamps
    end
  end
end
