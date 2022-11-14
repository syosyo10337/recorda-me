# 活動記録アプリ Recorda me

---
## 概要

このアプリは、日々の活動を15分単位で記録して、可視化できるアプリです。
勉強時間やの運動から、Youtubeでダラダラしちゃった時間まで家計簿感覚で記録できます。

---
## 実装した機能、技術
<img src="https://img.shields.io/badge/Ruby-3.0.4-red?style=plastic&logo=ruby">
<img src="https://img.shields.io/badge/Rails-6.1.7-critical?style=plastic&logo=rubyonrails">

- 記録を15分単位で保存する機能
- 直近のログ表示機能
- グラフによる記録の可視化機能
  **(chartkick && groupdate gem)**
  - 記録項目別
  - 項目別の比率
  - 週間累計時間表示
- ユーザ登録機能 **(devise gem)**
- ページネーション機能 **(kaminari gem)**



---
## インフラ構成図
- アプリケーションサーバ puma
- リバースプロキシ nginx
- postgreSQL for RDS
- Route 53 DNSサーバ ドメイン取得
- ALB for SSL処理 ロードバランシング
<image src="https://user-images.githubusercontent.com/110030968/201706923-890fcfea-0d89-4df4-8d1c-c6a5e0e8486c.png" style="width: 95%;">

---


#### 動機

私自身、何か物事に取り組む時にただ闇雲に始めると、いつの間にかどうでも良くなってしまう節があったので、シンプルなインターフェイスで時間を記録をし、それを可視化できるようにするために作成しました。。
記録するのが楽しくなるように、活動の項目を12色から好きな色で塗れるようにし、一目でどの色(活動)がどれくらいか見られるように工夫しました。
