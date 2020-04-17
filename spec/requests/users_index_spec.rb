require "rails_helper"

RSpec.describe "ユーザー一覧ページ", type: :request do
  let!(:user) { create(:user) }

  context "ログインしていないユーザーの場合" do
    it "ログインページへリダイレクトすること" do
      get users_path
      expect(response).to have_http_status "302"
      expect(response).to redirect_to new_user_session_path
    end
  end
end