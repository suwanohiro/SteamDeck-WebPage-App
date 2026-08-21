#!/bin/bash

DIR="$(cd "$(dirname "$0")" && pwd)"

# 引数があればそれ（$1）を使い、無ければGoogleをデフォルトにする
TARGET_URL="${1}"
if [ -z "$TARGET_URL" ]; then
    TARGET_URL="https://google.com/"
fi

# dist ディレクトリがあればそこを、なければ直下を検索対象にする
if [ -d "$DIR/dist" ]; then
    SEARCH_DIR="$DIR/dist"
else
    SEARCH_DIR="$DIR"
fi

# SteamDeck-WebPage-App-*.AppImage の中で一番新しい（バージョンが上の）ファイルを1つ取得
APP_PATH=$(ls -v "$SEARCH_DIR"/SteamDeck-WebPage-App-*.AppImage 2>/dev/null | tail -n 1)

if [ -z "$APP_PATH" ] || [ ! -f "$APP_PATH" ]; then
    echo "エラー: AppImage ファイルが見つかりません ($SEARCH_DIR)" >&2
    exit 1
fi

# 実行
exec "$APP_PATH" --appimage-extract-and-run --no-sandbox "$TARGET_URL"