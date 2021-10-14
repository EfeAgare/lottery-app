module LotteryDrawHelper
  
   def start_date
    Time.zone.now.strftime("%B #{Time.zone.now.day.ordinalize}, %Y")
  end

  def last_draw_date
    last_draw_date = lottery_number&.created_at
    last_draw_date&.strftime("%B #{Time.zone.now.day.ordinalize}, %Y") || "No draw yet"
  end

  def timer_count
    timer = (Time.zone.now - lottery_number&.created_at).seconds.to_i
    return 0 if timer > TIMER_COUNT
    TIMER_COUNT - timer
  end

  private

  def lottery_number
   LotteryDraw.with_lottery_number&.last
  end
end
