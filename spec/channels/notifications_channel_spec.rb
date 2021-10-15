require 'rails_helper'

RSpec.describe NotificationsChannel, type: :channel do
   it "successfully subscribes" do
    subscribe
    expect(subscription).to be_confirmed
  end

   it "successfully subscribes" do
    subscribe
    assert_has_stream_for 'notifications'
  end
end
