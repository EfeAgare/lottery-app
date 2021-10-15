require 'rails_helper'

RSpec.describe FinishLotteryDrawJob, type: :job do
  let(:job)	{ described_class.new }
  let(:user) { create :user, email: "efe@gmail.com", password: "lovelife" }

  it 'returns nil' do
    expect(job.perform).to eq nil
  end

  context 'when job is successful' do
    before do
      create :user_lottery, draw_status: 1, user: user
      create :lottery_draw
    end
    
    context 'when lottery draw status' do
      it 'returns true' do
        expect(job.perform).to eq true
      end
    end
  end

  context 'when no current_draw' do
    before do
      create :lottery_draw
      create :user_lottery, draw_status: 0, user: user
    end

    it 'returns nil' do
      expect(job.perform).to eq nil
    end

    it 'update lottery_draw' do
      job.perform
      expect(LotteryDraw.last.lottery_number).not_to eq nil
    end
  end
end
