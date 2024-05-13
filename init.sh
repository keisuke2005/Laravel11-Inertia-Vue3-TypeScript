#!/bin/bash

cd /var/www/html

# Composerの依存関係をインストール
composer install

# 環境設定ファイルをコピー
cp -fp .env.local .env

chown -R application:application ./*
chmod -R ug+rwx storage bootstrap/cache 


# アプリケーションキーを生成
php artisan key:generate

# 設定をキャッシュ
php artisan config:cache

# データベースマイグレーション
php artisan migrate --force

# データベースシーディング
php artisan db:seed --force

php artisan config:clear
