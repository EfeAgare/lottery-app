require 'rails_helper'

RSpec.describe LotteryDraw, type: :model do
  before do
   create :lottery_draw, lottery_number: "12345"
  end

  describe '#with_lottery_number' do
    it 'returns lottery_draw with lottery_number' do
      expect(LotteryDraw.with_lottery_number.any?).to eq true
    end
  end

  describe '#last_with_lottery_number' do
    it 'returns lottery_number' do
      last_lottery_number = LotteryDraw.with_lottery_number.last&.lottery_number

      expect(last_lottery_number).to eq LotteryDraw.last.lottery_number
    end
  end

  it "is valid with valid attributes" do
    expect(LotteryDraw.new).to be_valid
  end
end
