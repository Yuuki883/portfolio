class MapsController < ApplicationController
  def index
    # パラメーターから検索したい文字を受け取る
    # Google マップのAPiにアクセス
    # https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=%E6%9D%B1%E4%BA%AC&inputtype=textquery&fields=photos,formatted_address,name,rating,opening_hours,geometry&key=AIzaSyDMGRqUBFI2pMfVWFOiyWcf9zPoVHdd6DE
    # apiレスポンスをインスタンス変数に詰める
    # erbに展開する
  end
end
