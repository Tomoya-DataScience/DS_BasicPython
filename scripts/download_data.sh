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