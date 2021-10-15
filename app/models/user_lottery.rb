class UserLottery < ApplicationRecord
  belongs_to :user

  enum status: {
    not_involved: 0,
    win: 1,
    loss: 2
  }

  enum draw_status: {
    inactive: 0,
    in_progress: 1,
    completed: 2
  }

end
