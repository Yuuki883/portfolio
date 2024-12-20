※現在サーバー停止中
# アプリケーションの概要
歴史好きのユーザー同士の交流を目的とした、総合SNS型WEBサービス  
http://rails-portfolio-1712854299.ap-northeast-1.elb.amazonaws.com  
ログイン画面に採用担当者ログイン専用のメールアドレスとパスワードを設定しております。そちらをご使用してお入りください. 


# 技術的ポイント
・**AWS EC2/RDS**を用いたRails本番環境構築  
・**Docker**を用いたRails開発環境構築  
・**CircleCIによる自動ビルド&デプロイ**（AWS ECS/ECR × CircleCI)  
・**API**の使用（GooglemapAPI)  
・**Ajax**を用いた非同期処理（いいね)  
・**Bootstrap**によるレスポンシブ対応  
・**RSpec**でテスト記述  
・**11個のモデル**をそれぞれ関連付けて使用

# 機能
・訪れた場所の情報を投稿  
・投稿に対して「いいね」リクエストを送信  
・掲示板の作成（5chやまとめサイトの様なスレッド機能)  
・スポットマップ（GooglemapAPIを利用して訪れた場所を地図上に記録)  
・チャット機能  
・フォロー機能  
・検索（Ransackを使用)  
・ログイン   
・ページネーション (kaminariを使用)  

# 環境
■フレームワーク  
　Ruby on Rails  
■インフラ  
　AWS EC2, Docker  
■データベース  
　AWS RDS, mysql  
■Webサーバー  
　Nginx  

# ER図
 [ヒストリアン_ER図.pdf](https://github.com/user-attachments/files/17950543/_ER.pdf)
