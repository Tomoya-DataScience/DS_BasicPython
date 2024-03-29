# DataScienceコース 課題リポジトリ
DataScienceコースの課題提出に使うリポジトリです。  
実際の課題の進め方は下記を参照してください。

## 課題開始前のセットアップ

1. 個人でリポジトリを作成する。  
  1.1.このページの右上のUse This Templateをクリック  
  <img width="287" alt="スクリーンショット 2022-04-04 10 43 57" src="https://user-images.githubusercontent.com/70427875/161460844-add34447-42c7-40c2-9b2e-d662e24eef34.png">
  1.2.Ownerを自分（あなた）に変更し、Publicでリポジトリを作成する(include all branchesにはチェック入れない)  
  <img width="761" alt="スクリーンショット 2022-04-04 10 46 24" src="https://user-images.githubusercontent.com/70427875/161460958-acb2c2e8-edde-44d9-bc76-3e05a24cbf5b.png"><br>

2. 作成したリポジトリをクローンする。

3. ローカルで下記コマンドを実行し、課題に必要なモジュールをインストールしておく。
  ```shell
  pip install -r requirements.txt
  ```

## 課題の進め方
教材と課題が[こちら](https://shinonome.io/PythonTutorialForDSCourse)にまとまっています。 
受講生の皆さんは下記の手順で課題を進めてください
1. 読み物を読む  
2. 直後に確認問題があればそれを解く  
   - このとき、該当の確認課題を実装するためのブランチをつくり、そこで作業してください。
   - 確認課題はトピックごと数問の小問から構成されていますが、ブランチは**トピックごとに**作成してください。（小問ごとではありません）
3. 提出する  
  3.1 実装した内容をgithub上の対応するブランチにプッシュする  
  3.2 実装したブランチから`main`へのプルリクエストを作成する  
  3.3 プルリクエストのリンクをレビュワーに送信する  

## 各課題のレビュワー
|課題|レビュワー|
|:-:|:-:|
|Python入門|yuto|
|制御構文|kobakoba|
|関数|Ryuichi|
|numpy|tomoya|
|pandas|takeshun|
|matplotlib|Taichi(Ando)|
|scikit-learn|Taichi(Ando)|


# ※注意※コード規約について

課題を提出をするときは、

- コードがコード規約に従っている（PEP8）
- python3で解いている
- AOJのサイトに提出をしてACが出ている

ということを必ず確認してから提出するようにしてください。

<aside>
💡 **コード規約**

[PEP8](https://pep8-ja.readthedocs.io/ja/latest/)とは、Pythonにおけるスタイルガイドのこと。

スタイルガイドとは、変数や関数名の付け方、空白に関する内容や、インデントの仕方、コメントの書き方など様々な基本的なルールを定義しているもの。

実際の開発では複数人で作業することが一般的である。その際にコード規約に従うことでコードに一貫性が生まれ、可読性・保守性が高まり品質の向上につながる。

</aside>
このサイトで自分のコードがコード規約に従っているかチェックすることができます。(https://www.pythonchecker.com/)

### vscodeのsettings.jsonを編集してコード規約を自動的に守る方法

下のsettings.jsonファイルをダウンロードして.vscode直下に置いてください。(GitHubからリポジトリをクローンすれば、自動的にvscode直下に置かれます。)自動で保存時にコード規約に従ったコードへと変換されます。詳しくは[こちら](https://maku.blog/p/tfq2cnw/)。

black, flake8をインストールしていないとvscodeで警告が出るので自身の環境にあわせて(conda or pip)インストールしてください。↓
<img width="450" alt="スクリーンショット 2022-04-04 0 24 03" src="https://user-images.githubusercontent.com/70427875/161435394-b5018694-aee2-4a89-813d-9cfa4e9b7c15.png">


わからないことがあればslackで@eriにお願いします。

↓GitHubからクローンしてもvscode直下に置かれなかった方用<br>
[settings.json.zip](https://github.com/shinonome-inc/Basic-Python/files/8357521/settings.json.zip)


<img width="287" alt="スクリーンショット 2022-03-20 19 31 34" src="https://user-images.githubusercontent.com/83397726/160279459-afeb9b5e-cfb1-4aa3-b26d-1e1433ae816e.png">


（フォーマッターを使わない方は[こちら](https://atmarkit.itmedia.co.jp/ait/articles/1912/10/news045.html)を参考にしてください。）

## kaggle APIを用いたデータのダウンロードのやり方

任意のデータをKaggleからダウンロードして、それをダウンロードフォルダから任意のフォルダに移す...という  
作業が面倒な場合、Kaggle APIを用いて任意のディレクトリにデータを配置することができる。

### 手順

1. 仮想環境に入って、Kaggle APIを使えるようにする(`pip install kaggle`)。
2. `https://www.kaggle.com/<username>/account`にアクセスし、`Create New API Token`を選ぶ。  
すると、`kaggle.json`がダウンロードされる。これにはユーザー名とAPI Keyが含まれている。  
これをソースディレクトリ(=直下)に配置する。なお、`kaggle.json`の中身は以下の通りである。  
`{"username":"<username>","key":"<API Key>"}`  
(`<username>`と`<API Key>`はそれぞれKaggleのユーザー名とAPI Key)
3. `https://www.kaggle.com/competitions/competition_name`の`join competition`をクリックして  
`competition rule`を読み、`I understand accept`を必ずクリックすることに注意する。  
(これを行わないとスクリプトを実行するときに  
`403 - Forbidden - You must accept this competition's rules before you'll be able to download files.`と  
表示され、データがダウンロードできない)。  
その後、`env_name`で指定した仮想環境に入って、ソースディレクトリ(=直下)で`bash scripts/download_data.sh`を実行する。  
ホームディレクトリに`.kaggle/kaggle.json`がない場合、kaggleのユーザー名とAPI Keyが聞かれるので、  
それぞれ入力すると、ホームディレクトリに`.kaggle/kaggle.json`が作成され、  
`data/$data_dir`  (`$data_dir`はデータを保存したいディレクトリ)下に`competition_name`で指定した  
(今回は[https://www.kaggle.com/competitions/titanic](https://www.kaggle.com/competitions/titanic)のtitanicデータセット、
一般には`https://www.kaggle.com/competitions/competition_name`の`competition_name`の部分を指定すればいい)の  
`train.csv`と`test.csv`がダウンロードされる。  
ダウンロードするデータセット及びデータを保存したいディレクトリを変更したい場合、  
それぞれ`download_data.sh`の`competition_name`と`data_dir`を変更すればいい。

### スクリプトの解説

```shell:download_data.sh
#!/bin/bash

# ホームディレクトリに.kaggle/kaggle.jsonがない場合
if [[ ! -f ~/.kaggle/kaggle.json ]]; then
    echo -n "Kaggle username: "
    read USERNAME
    echo
    echo -n "Kaggle API key: "
    read APIKEY

    mkdir -p ~/.kaggle
    echo "{\"username\":\"$USERNAME\",\"key\":\"$APIKEY\"}" > ~/.kaggle/kaggle.json # ホームディレクトリに.kaggle/kaggle.jsonを作成
    chmod 600 ~/.kaggle/kaggle.json
    # セキュリティのためにchmod 600 ~/.kaggle/kaggle.jsonで、ファイルの読み書きの権限を所有者だけに変更すると良いらしい
    # これを行わないとkaggleコマンドを叩いた際にwarningが表示される。
fi

# 仮想環境の名前を指定
env_name = "kaggle"

source ~/envs/$env_name/bin/activate

pip install kaggle --upgrade

# コンペティション名を変数で指定
competition_name="spaceship-titanic"

# データをダウンロード
kaggle competitions download -c $competition_name

# データを保存するディレクトリ名を変数で指定
data_dir="spaceship-titanic"

# データを保存するディレクトリがない場合、作成する
mkdir -p "data/$data_dir"

# titanic.zipを解凍
unzip "$competition_name.zip" -d "data/$data_dir"

# 解凍したzipファイルを削除
rm "$competition_name.zip"
```
