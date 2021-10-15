class TimeNotificationJob < ApplicationJob
  queue_as :default

  def perform
    return unless timer
    FinishLotteryDrawJob.perform_now
    ActionCable.server.broadcast('notifications', { message: "Current draw is completed and a new one starts now" } )
  end
end
