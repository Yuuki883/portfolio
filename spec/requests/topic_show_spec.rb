require "rails_helper"

RSpec.describe "投稿一覧ページ", type: :request do
  let!(:user) { create(:user) }
  let!(:topic) { create(:topic, user: user) }

  context "ログインしていないユーザーの場合" do
    it "ログイン画面にリダイレクトすること" do
      get topic_path([:id])
      expect(response).to have_http_status "302"
      expect(response).to redirect_to new_user_session_path
    end
  end
end