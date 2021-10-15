require 'rails_helper'

RSpec.describe LotteryDrawHelper, type: :helper do

   before do
    create :lottery_draw
   end

  describe 'start_date' do
    it 'returns today date' do
      expect(helper.start_date).to eq(start_date)
    end
  end

  describe 'last_draw_date' do
    context 'when no draw' do
      before do
        allow(helper).to receive(:lottery_draw).and_return(nil)
      end
        
      it 'returns no draw yet' do
        expect(helper.last_draw_date).to eq("No draw yet")
      end
    end

    context 'when a previous draw' do
      it 'returns today date' do
        expect(helper.last_draw_date).to eq(last_draw_date)
      end
    end
  end

  describe 'timer_count' do
    before do
      allow(helper).to receive(:lottery_draw).and_return(lottery_draw)
    end

    context 'when timer is greater than 5 minutes' do
      
      it 'returns TIMER_COUNT' do
        expect(helper.timer_count).to eq timer_count
      end
    end
  end


  def start_date
    Time.zone.now.strftime("%B #{Time.zone.now.day.ordinalize}, %Y")
  end

  def last_draw_date
    last_draw_date = lottery_draw&.created_at
    last_draw_date&.strftime("%B #{Time.zone.now.day.ordinalize}, %Y") || "No draw yet"
  end

  def timer_count
    timer = (Time.zone.now - lottery_draw&.created_at).seconds.to_i
    return 0 if timer > TIMER_COUNT
    TIMER_COUNT - timer
  end
end
