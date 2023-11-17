#!/bin/bash

echo "パスワードマネージャーへようこそ！"

read -p "サービス名を入力してください：" service_name
read -p "ユーザー名を入力してください：" user_name
read -s -p "パスワードを入力してください：" password
echo

echo "$service_name:$user_name:$password" >> password_manager.txt

echo "Thank you❗️"
