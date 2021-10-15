require 'rails_helper'

RSpec.describe "UserLotteries", type: :request do
  before do
    allow(controller).to receive(:user_lotteries).and_return([])
  end

  describe "GET /user_lottery/index" do
    it "returns http success" do
      get "/user_lottery/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "/user_lottery/create" do
    before do
      sign_in create :user, email: "efe@gmail.com", password: "password"
    end

    it "returns http success" do
      headers = { "ACCEPT" => "application/json" }
      post "/user_lottery/create", params: { lottery_number: "123456", draw_status: "in_progress" }, headers: headers

      expect(response).to have_http_status(:success)
    end

    it "returns content type" do
      headers = { "ACCEPT" => "application/json" }
      post "/user_lottery/create", params: { lottery_number: "123456", draw_status: "in_progress" }, headers: headers

      expect(response.content_type).to eq("application/json")
    end
  end
end
