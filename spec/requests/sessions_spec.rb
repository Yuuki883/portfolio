require 'rails_helper'

RSpec.describe "ログイン画面", type: :request do

  describe "ログイン画面にアクセスした時" do
    it 'ログイン画面の表示に成功すること' do
      get new_user_session_path
      expect(response).to have_http_status(200)
    end
  end
end