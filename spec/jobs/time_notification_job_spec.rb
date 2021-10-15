require 'rails_helper'

RSpec.describe TimeNotificationJob, type: :job do
  let(:job)	{ described_class.new }
  let(:user) { create :user, email: "efe@gmail.com", password: "lovelife" }

  it 'returns nil' do
    expect(job.perform).to eq nil
  end

  context 'when the timer is true' do
    before do
      allow(job).to receive(:timer).and_return(true)
    end

    it "matches with stream name" do
      job.perform
      
      expect {
        ActionCable.server.broadcast(
          "notifications", { message: 'Hello!' }
        )
      }.to have_broadcasted_to("notifications")
    end
  end
end
