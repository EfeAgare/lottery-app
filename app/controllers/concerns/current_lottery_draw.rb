module CurrentLotteryDraw

  private

  def set_draw
    begin
      session[:draw_id] = nil if timer
      @draw = LotteryDraw.find_by_lottery_number(nil) || LotteryDraw.find(session[:draw_id])
    rescue ActiveRecord::RecordNotFound
      @draw = LotteryDraw.create
      session[:draw_id] = @draw.id
    end
  end

  def timer
    last_draw = LotteryDraw.last
    return false if last_draw.blank?
    timer = (Time.zone.now - last_draw&.created_at).seconds.to_i
    return true if (TIMER_COUNT - timer) <= 0
    false
  end

end