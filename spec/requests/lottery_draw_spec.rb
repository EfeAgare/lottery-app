require 'rails_helper'

RSpec.describe "LotteryDraws", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/lottery_draw/index"
      expect(response).to have_http_status(:success)
    end
  end

end
