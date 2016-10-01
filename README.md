# tumblr_photo_bulk_post

## 前提
* tumblrのアカウントを持っている事

## 環境
* OS
	* MacOSX 10.11.13
* Ruby
	* 2.3.0

## インストール
```
$ gem install sinatra
$ gem install tumblr_client
$ gem install thin
```

## tumblrの準備
1. tumblrにログイン
1. https://www.tumblr.com/oauth/apps にてアプリを追加し、consumer_keyとconsumer_secretを取得
1. https://api.tumblr.com/console/calls/user/info に上記で取得した、consumer_keyとconsumer_secretを使って、oauth_tokenとoauth_token_secretを取得
1. 取得した値を `myapp.rb` に設定する

## 使い方
1. `$ sudo thin start -d` して起動してください。
1. [localhost:3000](http://localhost:3000) にブラウザでアクセス
1. ` 画像パス` にtumblrに投稿したい画像か画像のあるディレクトリをフルパスで指定
1. `タイトル` に画像のキャプションを`url`にリンクを、`tags`にカンマ区切りで投稿に付けるタグを、それぞれ設定
1. `ステータス` に`draft(下書き)`,`queued(自動投稿)`,`published(即時投稿)` のいずれかを設定
1. `送信`をクリック
1. 画像が投稿されます

## 注意事項的な何か
* thinの設定次第では送信後に画面がタイムアウトします。thinの設定をさがしてみてください。


## 参考URL
名前 | url
---|---
tumblr API開発者向けドキュメント|https://www.tumblr.com/docs/en/api/v2
tumblr本家git|https://github.com/tumblr/tumblr_client
sinatra日本語ドキュメント|http://www.sinatrarb.com/intro-ja.html
 