class LotteryDraw < ApplicationRecord
  scope :with_lottery_number, -> { where.not(lottery_number: nil) }
  scope :last_with_lottery_number, -> { with_lottery_number&.last&.lottery_number }
end
