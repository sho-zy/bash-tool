# Bash Tool

## ファイルコピー [copyFile]

masterディレクトリに存在する指定ファイルを、\
指定ディレクトリ配下に上書きコピーするツールです。\
ディレクトリがない場合は自動で作成されます。

### ファイル説明

* 実行シェル: copyFile.sh
* 基本設定: setting.ini
　┗master/targetディレクトリ配置パス、masterディレクトリ名、ディレクトリ設定、対象ファイル設定
* ディレクトリ設定: destDir.list
　┗ディレクトリ名を１行ずつ指定
* 対象ファイル設定: module.list
　┗ファイル名を１行ずつ指定

### 使用方法

1. 各種設定(※上記ファイル説明参照)
2. シェル配置ディレクトリに移動
```
cd /path/to/dir/bash-tool/copyFile
```
3. シェル実行
```
./copyFile.sh
```

### バリデーション

「copyFile.sh」コード内を参照ください。