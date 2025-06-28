# dotfiles

## 手順
- Apple ID でログイン
- Homebrew 入れる
- インストール
  - Chrome
  - Google日本語入力
    - システム設定 > キーボード > 入力ソース > 編集 > 日本語 and 英語 > Google日本語入力
  - Warp
  - Slack
  - Raycast
  - Cursor
  - Notion
  - Obsidian
  - Git
  - GitHub CLI 導入
  - mise 導入
  - tree
  - Docker

## Chrome Extensions
- DeepL
- Vue.js devtools
- GraphQL Network Inspector
- Adblock Plus - free ad blocker
- Save to Notion
- ColorZilla
- Wappalyzer

## Corsor / VSCode
### Settings
- Editor: Enable Preview ---> Deselect

### Extensions

## その他
#### デスクトップ上のアイコン表示を無効にする
ターミナルで下記を実行
```shell
defaults write com.apple.finder CreateDesktop -bool FALSE;killall Finder
```

#### スクリーンキャプチャのファイル名変更
```shell
defaults write com.apple.screencapture name "screen_shot"

# => 「screen_shot 2025-06-28 22.09.57」
```
