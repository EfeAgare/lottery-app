class CreateUserLotteries < ActiveRecord::Migration[6.1]
  def change
    create_table :user_lotteries do |t|

      t.integer :status, default: 0
      t.integer :draw_status, default: 0
      t.string :lottery_number
      t.references :user

      t.timestamps
    end
  end
end
