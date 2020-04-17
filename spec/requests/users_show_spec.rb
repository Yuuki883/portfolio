require "rails_helper"

RSpec.describe "プロフィールページ", type: :request do
  let!(:user) { create(:user) }

  context "ログインしていないユーザーの場合" do
    it "ログインページへリダイレクトすること" do
      get user_path([:id])
      expect(response).to have_http_status "302"
      expect(response).to redirect_to new_user_session_path
    end
  end
end