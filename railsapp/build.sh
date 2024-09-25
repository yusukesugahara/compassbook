#!/usr/bin/env bash


# Gitサブモジュールが存在するかチェックし、なければスキップ
if [ -d .git ]; then
  git submodule init
  git submodule update
else
  echo "Not a git repository, skipping submodule update."
fi

# 通常のビルドプロセス
bundle install
yarn install
