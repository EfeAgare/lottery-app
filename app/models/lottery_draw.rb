class LotteryDraw < ApplicationRecord
  scope :with_lottery_number, -> { where.not(lottery_number: nil) }
end
