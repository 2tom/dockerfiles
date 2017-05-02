gitbook用文書の作り方
=========

## プロジェクトフォルダ作成
```
$ mkdir [DIR] ; cd [DIR]
$ ./run.sh [DIR]
```

## NVM環境変数の読み込み
```
# source /root/.nvm/nvm.sh
# npm init -y
```

## gitbook の開始
```
# gitbook init
# npm install --save gitbook-plugin-hide-published-with gitbook-plugin-mermaid-2

# vi book.json
{
  "plugins": ["mermaid-2", "hide-published-with"],
  "pluginsConfig": {
    "mermaid-2": {
      "theme": "forest"
    }
  }
}
```

## mermaid-2 バグ対応
```
# vi node_modules/gitbook-plugin-mermaid-2/index.js

js: [
  'bower_components/mermaid/dist/mermaid.min.js',
  'plugin.js'
],

```

## serve モードで起動
```
# gitbook serve
```

## HTMLファイル作成
```
# gitbook build
```

## PDF作成
```
# gitbook PDF
```
