#!/bin/bash

if [[ ! -f ~/.kaggle/kaggle.json ]]; then
    echo -n "Kaggle username: "
    read USERNAME
    echo
    echo -n "Kaggle API key: "
    read APIKEY

    mkdir -p ~/.kaggle
    echo "{\"username\":\"$USERNAME\",\"key\":\"$APIKEY\"}" > ~/.kaggle/kaggle.json
    chmod 600 ~/.kaggle/kaggle.json
fi

pip install kaggle --upgrade

kaggle competitions download -c titanic

# titanic.zipを解凍
unzip titanic.zip

# ディレクトリ名を変数で指定
data_dir="titanic"

mkdir -p "data/$data_dir"

# ファイルをdataディレクトリに移動
mv gender_submission.csv train.csv test.csv "data/$data_dir"

# 解凍したファイルやzipファイルを削除
rm titanic.zip