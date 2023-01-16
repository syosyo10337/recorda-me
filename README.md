# 記録アプリ Recorda me


## 概要

このアプリは、日々の活動を15分単位で記録して、可視化できるアプリです。
勉強時間やの運動から、Youtubeでダラダラしちゃった時間まで家計簿感覚で記録できます。

<a href="https://www.recorda-me.link">https://www.recorda-me.link</a>


## 実装した機能、技術
<div style="padding-bottom: 5px">
<img src="https://img.shields.io/badge/Ruby-3.0.4-red?style=flat-square&logo=ruby">
<img src="https://img.shields.io/badge/Rails-6.1.7-critical?style=flat-square&logo=rubyonrails">
<img src="https://img.shields.io/badge/Docker-20.10.21-blue?style=flat-square&logo=docker">
<img src="https://img.shields.io/badge/Bootstrap-5.2.1-blueviolet?style=flat-square&logo=bootstrap">
(<img src="https://img.shields.io/badge/React-18.2.0-9cf?style=flat-square&logo=react">)

</div>

- 記録を15分単位で保存する機能
- 直近のログ表示機能
- グラフによる記録の可視化機能
*(chartkick gem && groupdate gem)*
  - 記録項目別
  - 項目別の比率
  - 週間累計時間表示
- ユーザ登録機能 *(devise gem)*
- ゲストログイン機能
- ページネーション機能 *(kaminari gem)*
- レスポンシブによるモバイル対応

- 開発環境 *(docker)*
- CSSフレームワーク *(Bootstrap5)*
- インフラ構築 *(AWS)*
- linter/formatter *(Rubocop)*
- テストフレームワーク *(Rspec)*
- CI/CDパイプライン *(Circle CI, Capistrano)*
- pull requestを用いた実務を想定した開発


- (導入中)Reactコンポーンネントによる一部ページのシングルページ化

## データモデル
<img src="https://user-images.githubusercontent.com/110030968/206081563-8d077278-4fab-49b4-a9dc-e5226c111370.svg">



## インフラ構成図
- アプリケーションサーバ *puma*
- リバースプロキシ *nginx*
- RDS for postgresql
- Route 53 - DNSサーバ/ドメイン取得
- ALB for SSL処理/負荷分散

<img src="https://user-images.githubusercontent.com/110030968/206081111-351bd3a2-a0b0-4e02-a93e-d5ff41ae6365.svg">


## 動機

私自身何か物事に取り組む時に、ただ闇雲に始めてしまい、いつの間にか興味を失いやめてしまうことが多々ありました。
シンプルなインターフェイスで時間を記録をし可視化できれば、モチベーション維持に繋がり、継続できるのではないかと考えこのアプリの作成にいたりました。
記録するのが楽しくなるように、活動の項目を12色から好きな色で塗れるようにし、一目でどの色(活動)がどれくらいか見られるように工夫しました。
