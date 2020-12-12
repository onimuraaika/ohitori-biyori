# ![ピンク　オレンジ　ネイルサロン　ロゴ](https://user-images.githubusercontent.com/69783418/101982683-18587a00-3cb9-11eb-8125-5cf2d17ad292.png)

## サイト概要
__おひとり日和(びより)は、「女性のひとり暮らしを楽しく素敵に。」をテーマにしたライフスタイル投稿サイトです。__  
ひとり暮らしを楽しく充実させたい女性に向けて、__お出かけ、雑貨、グルメ、レシピ、ファッション、節約術__など  
ひとり暮らしを素敵にする情報を共有できます。

おひとり日和サイトはこちら　→　https://ohitori-biyori.work/  
※お試しログインでサイトを閲覧できます。
<img width="1662" alt="トップ画面" src="https://user-images.githubusercontent.com/69783418/101981905-8dc14c00-3cb3-11eb-9412-c27b8b10559f.png">
### サイトテーマ
「女性のひとり暮らしを楽しく素敵に。」

### テーマを選んだ理由(想い)
女性のひとり暮らしをより楽しく素敵にするお手伝いをしたい、という想いで製作しました。

生活情報サイトはすでに数多く存在していますが、  
**ひとり暮らし**に特化した生活情報を発信しているサイトはなかなか見つかりません。  
ネットの上位に出てくる人気投稿は、現実味がなく、すぐには真似できないものです。  
**ひとり暮らし**という同じ背景をもつ人々が集い、生活で本当に役立つリアルな情報を発信・共有できるサイトを作りたいと考えました。  

友人には言い出しにくい生活の悩みも匿名なら相談しやすい、温かみのあるサイト作りを意識しました。  

「おひとり日和」を通じて、今の生活をもっと楽しく素敵に変えるお手伝いができれば嬉しいです。

### ターゲットユーザ
* ひとり暮らしをこれから始める女性
* ひとり暮らしを充実させるための役立つ情報がほしい女性
* ひとり暮らしならではの悩みを抱えている女性
* ひとり暮らしに慣れてきて楽しさを発信したい女性
* ひとり暮らしに慣れて新しい楽しみ方を探している女性

### 主な利用シーン
* ひとり暮らしの楽しみ方を見つける
* ひとり暮らしでのお役立ち情報を得る
* ひとり暮らしならではの悩みを解決する方法を見つける
* ひとり暮らしの楽しみ方を共有・共感する

## 設計書
* ER図
https://drive.google.com/file/d/18ER-G7WOfVFgUU6X1QZ9oN1S0ppUVlBr/view?usp=sharing

* ワイヤーフレーム
https://drive.google.com/file/d/1jwf6lZcaLfpGa3BxTL0IXYvhEEMryO19/view?usp=sharing

* テーブル定義書
https://docs.google.com/spreadsheets/d/1StMi5XKPNnyye3H8NMhQqE0h1OcpVp31BAV7Q6KhIsc/edit?usp=sharing

* アプリケーション詳細設計
https://docs.google.com/spreadsheets/d/1fFdHXg-D27azZRg0GS8lUH4ksh0eg07RF1wfQJPRcYk/edit?usp=sharing

## 機能一覧
https://docs.google.com/spreadsheets/d/1RF2XLkZoFw_vR4MrM4Nd46LtIvuf8_I7OLgZrszj4zQ/edit?usp=sharing
* ログイン機能(devise)
* 投稿機能(画像アップロード)
* コメント機能(非同期)
* お気に入り保存機能(非同期)
* フォロー機能(非同期)
* タグ付け機能
* 検索機能（キーワード/タグ/ジャンル）
* バッチ処理
* 通知機能

## 開発環境
* OS：Linux(CentOS)
* 言語：HTML,CSS,Ruby,JavaScript
* フレームワーク：Ruby on Rails
* CSSライブラリ：Bootstrap
* JSライブラリ：jQuery
