# 記録アプリ Recorda me

## 概要

このアプリは、日々の活動を15分単位で記録して、可視化できるアプリです。
勉強時間やの運動から、Youtubeでダラダラしちゃった時間まで家計簿感覚で記録できます。

<a href="https://www.recorda-me.link">https://www.recorda-me.link</a>

GUESTでのログイン
```
ID: guest@example.com
Password: guestpass
```

## 実装した機能、技術
<div style="padding-bottom: 5px">
<img src="https://img.shields.io/badge/Ruby-3.0.4-red?style=for-the-badge&logo=appveyor&logo=ruby.svg">
<img src="https://img.shields.io/badge/Rails-6.1.7-critical?style=for-the-badge&logo=appveyor&logo=rubyonrails.svg">
<img src="https://img.shields.io/badge/Docker-20.10.21-blue?style=for-the-badge&logo=appveyor&logo=docker.svg">
<img src="https://img.shields.io/badge/Bootstrap-5.2.1-blueviolet?style=for-the-badge&logo=appveyor&logo=bootstrap.svg">
</div>

- 記録を15分単位で保存する機能
- 直近のログ表示機能
- グラフによる記録の可視化機能
*(chartkick gem && groupdate gem)*
  - 記録項目別
  - 項目別の比率
  - 週間累計時間表示
<br />
- ユーザ登録機能 *(devise gem)*
- ページネーション機能 *(kaminari gem)*

- 開発環境 *(docker)*
- CSSフレームワーク *(Bootstrap5)*

## インフラ構成図
- アプリケーションサーバ *puma*
- リバースプロキシ *nginx*
- RDS for postgresql
- Route 53 - DNSサーバ/ドメイン取得
- ALB for SSL処理/負荷分散

<img src="https://user-images.githubusercontent.com/110030968/201706923-890fcfea-0d89-4df4-8d1c-c6a5e0e8486c.png" style="width: 90%;">

#### 作成動機

私自身、何か物事に取り組む時にただ闇雲に始めると、いつの間にかどうでも良くなってしまう節があったので、シンプルなインターフェイスで時間を記録をし、それを可視化できるようにするために作成しました。
記録するのが楽しくなるように、活動の項目を12色から好きな色で塗れるようにし、一目でどの色(活動)がどれくらいか見られるように工夫しました。
