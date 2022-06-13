# finetuning-nttdialoguemodel

対話モデルを用いた対話実行方法をいかに示します。(木内)

## requirement

-   Python 3.8 　以降
-   CUDA 11.1/10.2
-   Pytorch 1.8.2 （For the installation commands, be sure to check the official page. We recommend using pip.)
-   fairseq 1.0.0a0（Available only from github: validated commit ID was 8adff65ab30dd5f3a3589315bbc1fafad52943e7）
-   sentencepiece 0.1.96

## fairseq

fairseq の実行方法が特殊なため以下にインストール方法を記述致します

```bash
cd /path/to/any/directory
git clone https://github.com/facebookresearch/fairseq.git
cd fairseq

# commit hashをリセット
git reset --hard 8adff65ab30dd5f3a3589315bbc1fafad52943e7

pip install --editable ./
```

## dialog.py 実行方法

```bash
    cd src/

    python dialog.py ../data/PreprocessedBinaryData/saya_empathetic_labeled/   \
        --path ../model/saya_empathetic_labeled_MODEL/fine_tuned_models/checkpoint_best.pt \
        --beam 80  \
        --min-len 10 \
        --source-lang src \
        --target-lang dst  \
        --tokenizer space  \
        --bpe sentencepiece  \
        --sentencepiece-model ../model/spm/sp_oall_32k.model  \
        --no-repeat-ngram-size 3  \
        --nbest 80 \
        --sampling  \
        --sampling-topp 0.9  \
        --temperature 1.0 \
        --show-nbest 5

```

# 以下堀内さんが記述したドキュメント

## 概要

このリポジトリには，NTT が提供する，日本語 Transformer Encoder-decoder 対話モデルを，[fairseq](https://github.com/pytorch/fairseq)上で学習するためのスクリプトが含まれています。

### 利用方法

#### 実行環境

-   Python 3.8 以降
-   sentencepiece>=0.1.91
-   torch>=1.5.1
-   torchvision>=0.6.1

### 共有されているモデルをどこに置くか

-   学習データ
    -   下のディレクトリ構造を参照
-   モデル

    -   事前学習済応答生成モデル

        -   `model/base` に置く
        -   `1.6B_2lhzhoam_4.92.pt`か`empdial50k-flat_1.6B_19jce27w_3.86.pt`か`persona50k-flat_1.6B_33avog1i_4.16.pt`を置けばよいです
        -   使用するモデル名を`setting_fine_tuning.sh`で変更するようにしてください

    -   spm
        -   `model/spm` に置く
        -   sp_oall_32k.{model, txt, vocab}をすべて置いてください

### ディレクトリ構造

-   data

    -   学習に必要なデータを格納するディレクトリです
    -   Subdir
        -   RawData
            -   事前処理する前のコードを入れるところです
            -   サブディレクトリごとにデータを分けると便利です
            -   <b>以下の規則を必ず守ってください</b>
                -   学習データの入力データファイル名：train.context
                -   学習データの出力データファイル名：train.response
                -   検証データの入力データファイル名：valid.context
                -   学習データの入力データファイル名：valid.response
        -   PreprocessedData
            -   事前処理をしてトークナイズされたデータを入れるところです
            -   トークナイズがきちんとされているか確認してください
            -   サブディレクトリごとにデータを分けると便利です
        -   PreprocessedBinaryData
            -   バイナリ化された事前処理をしてトークナイズされたデータを入れるところです
            -   人間には解読不可能です。
            -   一度処理をしてこのディレクトリに dict.context.txt が生成されてしまうと事前処理が走らなくなるので注意してください
            -   更にサブディレクトリごとにデータを分けると便利です

-   src
    -   学習や事前準備に必要なコードがまとまっています
        -   prepro_spm.py
            -   生データを事前処理してセンテンスピースを使ってトークナイズするスクリプトです
        -   preprocess_fairseq.sh
            -   事前処理されたデータをバイナリにするスクリプトです
        -   setting_fine_tuning.sh
            -   学習用のパラメータを少しまとめたスクリプトです
            -   モデル構造等を書きます
        -   train_fine_tuning.sh
            -   学習を実行するスクリプトです
            -   学習時のパラメータはここで調節します
        -   train_sentencepiece_model.py
            -   トークナイザーを学習するスクリプトです
            -   メンテナンスしていないので動くか不明です

### 学習方法の詳細

1. prepro_spm.py を実行
2. bash preprocess_fairseq.sh を実行
3. bash train_fine_tuning.sh を実行
