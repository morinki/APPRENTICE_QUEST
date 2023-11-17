#!/bin/bash

password_file="password_manager.txt.gpg"

echo "パスワードマネージャーへようこそ！"
while true; do
  read -p "次の選択肢から入力してください(Add Password/Get Password/Exit):" choise

  case $choise in
    "Add Password")
      read -p "サービス名を入力してください：" service_name
      read -p "ユーザー名を入力してください：" user_name
      read -s -p "パスワードを入力してください：" password
      echo  
      echo "$service_name:$user_name:$password" >> password_manager.txt
      gpg -c password_manager.txt       #ファイルを暗号化
      rm password_manager.txt       
      echo "パスワードの追加は成功しました"
      ;;

    "Get Password")
      gpg -d $password_file > password.manager.txt #ファイルを複合化
      read -p "サービス名を入力してください：" service_name
      if grep -q "$service_name" password_manager.txt; then
        data=$(grep "$service_name" password_manager.txt)
        IFS=':' read -r get_service get_user get_password <<< "$data"
        echo "サービス名：$get_service"
        echo "ユーザー名：$get_user"
        echo "パスワード：$get_password"
      else
        echo "そのサービスは登録されていません。"
      fi
      rm password_manager.txt
      ;;

    "Exit")  
      echo "Thank you❗️"
      break
      ;;

    *)
      echo "入力が間違えています。 Add Password/Get Password/Exit から入力してください。"
      ;;

  esac
done