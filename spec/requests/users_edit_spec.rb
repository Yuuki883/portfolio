require "rails_helper"

RSpec.describe "プロフィール編集", type: :request do
  let!(:user) { create(:user) }
  let!(:other_user) { create(:user) }

  context "ログインしていないユーザーの場合" do
    it "ログイン画面にリダイレクトすること" do
      # 編集
      get edit_user_path(user)
      expect(response).to have_http_status "302"
      expect(response).to redirect_to new_user_session_path
      # 更新
      patch user_path(user), params: { user: { name: user.name,email: user.email } }
      expect(response).to have_http_status "302"
      expect(response).to redirect_to new_user_session_path
    end
  end
end