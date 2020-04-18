require 'rails_helper'

RSpec.describe "ログイン", type: :request do
  let!(:user) { create(:user) }

  describe "ログイン" do
    it "正常なレスポンスを返すこと" do
      get new_user_session_path
      expect(response).to be_success
      expect(response).to have_http_status "200"
    end
    it "有効なユーザーでログイン" do
      get new_user_session_path
      post user_session_path, params: { session: { email: user.email, password: user.password } }
    end
  end
end