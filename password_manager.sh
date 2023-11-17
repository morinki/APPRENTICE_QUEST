#!/bin/bash

echo "パスワードマネージャーへようこそ！"
read -p "次の選択肢から入力してください(Add Password/Get Password/Exit):" choise

case $choise in
  "Add Password")
    read -p "サービス名を入力してください：" service_name
    read -p "ユーザー名を入力してください：" user_name
    read -s -p "パスワードを入力してください：" password
    echo  
    echo "$service_name:$user_name:$password" >> password_manager.txt
    echo "パスワードの追加は成功しました"
    ;;

  "Get Password")
    echo "入力確認、$choise"
    ;;

  "Exit")  
    echo "Thank you❗️"
    ;;

  *)
    echo "入力が間違えています。 Add Password/Get Password/Exit から入力してください。"
    ;;

esac