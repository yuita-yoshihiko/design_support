![ogp](https://user-images.githubusercontent.com/108202935/222415949-c5ed3243-ce20-48f4-aefb-0363dabbe96f.jpg)  

## 誰でもデザイン  
[サービスへのリンク](https://www.anyone-design.com)  
[サービス紹介記事](https://qiita.com/y_yuita/items/1b32fc3153205996a961)
  
## サービス概要  
誰でもデザインは、Web系デザイン初学者向けの情報検索・閲覧サービスです。  
Web系デザインに関する情報をジャンルごとにWebサイト、書籍、動画の3つの媒体に分けて掲載しており  
学びたい情報を自分に合った媒体で探すことができます。  
  
## ターゲットユーザー  
デザイン初心者で何から始めたらいいかわからない人。  
Web系のデザインの基本的な情報を手軽に収集、管理したい人。  
Webデザイナーやエンジニアを目指しており、デザインの基礎やUI/UXについて勉強し始めた人。   
  
## 主要機能一覧   
・情報の閲覧、検索機能  
・情報のレコメンド機能（2種類）  
・トレンド情報の閲覧  
・情報のお気に入り、リスト化機能  
・カラー抽出機能  
・UI・UXクイズ  
・星レビュー機能  
・高レビュー情報のピックアップ  
・情報追加時の通知機能  
・GoogleMapを用いたデザインギャラリー  
  
  
### 情報の閲覧、検索機能  
トップページに情報ジャンルの一覧を表示しており、  
そこからジャンルごとの情報一覧ページに遷移することができます。  
検索バーは情報のタイトルのあいまい検索を実装し、オートコンプリート化しています。  
[![Image from Gyazo](https://i.gyazo.com/6f973d3292a15ab2de363e4d550ef5ec.gif)](https://gyazo.com/6f973d3292a15ab2de363e4d550ef5ec)  
  

### 情報のレコメンド機能（2種類）  
1つ目は3つの質問を用意し、ユーザーの答えに応じたおすすめの情報を表示する機能です。  
[![Image from Gyazo](https://i.gyazo.com/c5187b69e8a373ebca08a8862d61a1c3.gif)](https://gyazo.com/c5187b69e8a373ebca08a8862d61a1c3)  
  

もう一つはユーザーがお気に入り登録した情報から情報をピックアップしてトップページに表示するものです。  
[![Image from Gyazo](https://i.gyazo.com/3b6ab713a11727b1452020f9f664f6b9.png)](https://gyazo.com/3b6ab713a11727b1452020f9f664f6b9)  
  

### トレンド情報の閲覧  
外部サービスから取得したトレンド情報を閲覧できます。  
[![Image from Gyazo](https://i.gyazo.com/3e7ec08a193150586bc2cee3d96a7822.gif)](https://gyazo.com/3e7ec08a193150586bc2cee3d96a7822)  
  

### 情報のお気に入り、リスト化機能  
ログイン後に気に入った情報のお気に入り登録と、お気に入りした情報を  
任意の名前をつけたリストに分類して管理することができるようになります。  
[![Image from Gyazo](https://i.gyazo.com/c7ca10167f67224c722be1ae45bcea88.gif)](https://gyazo.com/c7ca10167f67224c722be1ae45bcea88)  
  

### カラー抽出機能  
GoogleCloudVisionAPIの画像解析機能を利用して  
画像に多く使われている色を5色抽出する機能です。  
お気に入りの画像や写真と同じ雰囲気のサイトを作りたい時や  
ロゴやOGPなどから色を抽出してそれに寄せた配色をサポートすることを想定しています。  
[![Image from Gyazo](https://i.gyazo.com/82294921963c349d27310e277056b467.gif)](https://gyazo.com/82294921963c349d27310e277056b467)  
  

### UI・UXクイズ  
UI・UXについてクイズ形式で学べる機能です。  
[![Image from Gyazo](https://i.gyazo.com/ecb1be5efaa1a5bfac002da0ce2e2d4a.gif)](https://gyazo.com/ecb1be5efaa1a5bfac002da0ce2e2d4a)  
  

### 星レビュー機能  
5点満点で情報にレビューを付けることができます。  
[![Image from Gyazo](https://i.gyazo.com/b5f2af2cbfd9f84943d0b590d4dd3512.gif)](https://gyazo.com/b5f2af2cbfd9f84943d0b590d4dd3512)  
  

### 高レビュー情報のピックアップ  
レビューの点数が高い情報をトップページに表示させてユーザーの目に触れやすくしています。  
[![Image from Gyazo](https://i.gyazo.com/42a5561fed799cc7d985859b2699598a.png)](https://gyazo.com/42a5561fed799cc7d985859b2699598a)  
  

### 情報追加時の通知機能  
新たな情報が追加された際にはユーザーに通知されるようになっています。  
未読の通知があると通知ボタンの右上にオレンジのアイコンが表示され、  
既読になると消えるように実装しています。  
[![Image from Gyazo](https://i.gyazo.com/f012d1084425f34cf3c07d969617d2e2.gif)](https://gyazo.com/f012d1084425f34cf3c07d969617d2e2)  
  

### GoogleMapを用いたデザインギャラリー  
サービスのアクセントの意味も込めて  
GoogleMapを用いて見た目のインパクトのある機能を実装しました。  
ピンをクリックすると対象の地域の優れたデザインのWebサイトへのリンクが表示されます。  
[![Image from Gyazo](https://i.gyazo.com/b1c27b2d8407246530da011ed654e956.gif)](https://gyazo.com/b1c27b2d8407246530da011ed654e956)  
  
  

## その他の機能
・ユーザー登録、ログイン機能  
・Twitter,Googleログイン機能  
・パスワードリセット機能  
・利用規約、プライバシーポリシー  
・お問い合せ機能  
・管理者画面  

## 主な使用技術
### バックエンド  
Ruby(3.1.3)  
Ruby on Rails(7.0.4)  

### フロントエンド  
TailwindCSS  
daisyUI  

### インフラ  
PostgreSQL  
Heroku  
Docker  
docker-compose  
GitHub Actions  

### API(ログイン機能に使用)  
Twitter API  
Google API  
Google Cloud Vision API  
pixabay API  
Google Map API  

## 画面遷移図
[画面遷移図](https://www.figma.com/file/GddVj9pDkApNER6qXSPhmY/%E3%83%9D%E3%83%BC%E3%83%88%E3%83%95%E3%82%A9%E3%83%AA%E3%82%AA%E7%94%BB%E9%9D%A2%E9%81%B7%E7%A7%BB%E5%9B%B3?node-id=0%3A1&t=eQoRBW5SHxuSMXco-0)

## ER図
[ER図][![Image from Gyazo](https://i.gyazo.com/ee68e5469d483ed38702f58f333f8a72.png)](https://gyazo.com/ee68e5469d483ed38702f58f333f8a72)  
