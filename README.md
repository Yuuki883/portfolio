# アプリケーションの概要
歴史好きのユーザー同士が交流できる、総合SNS型WEBサービス。

# 技術的ポイント
**AWS EC2/RDS**を用いたRails本番環境構築  
**Docker**を用いたRails開発環境構築  
**CircleCIによる自動ビルド&デプロイ**（AWS ECS/ECR × CircleCI)  
**API**の使用（GooglemapAPI  
**Ajax**を用いた非同期処理（いいね  
**Bootstrap**によるレスポンシブ対応  
**RSpec**でテスト記述  
**11つのモデル**をそれぞれ関連付けて使用  

# アプリケーションの機能
・訪れた場所の情報を投稿
・投稿に対して「いいね」リクエストを送信
・掲示板の作成（5chやまとめサイトの様なスレッド機能）
・スポットマップ（GooglemapAPIを利用して訪れた場所を地図上に記録）
・チャット機能
・フォロー機能
・検索（Ransackを使用）
・ログイン
・ログイン状態の保持
・ページネーション (kaminariを使用)
・モデルに対するバリデーション

# 環境
■フレームワーク
　Ruby on Rails
■インフラ
　AWS EC2, Docker
■データベース
　AWS RDS, mysql
■Webサーバー
　Nginx
