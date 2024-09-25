#!/usr/bin/env bash

# サブモジュールの初期化と更新
git submodule init
git submodule update

# 通常のビルドプロセス
bundle install
yarn install
