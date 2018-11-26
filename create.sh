#! /bin/bash
echo 'EOS 智能合约模版创建'


if hash cleos 2>/dev/null; then 
    if hash eosio-cpp 2>/dev/null; then 
        echo -e "\033[32m已经安装eosio.cdt工具 \033[0m"
        else
       git clone --recursive https://github.com/eosio/eosio.cdt
       cd eosio.cdt
       ./build.sh
       sudo ./install.sh
       cd ../
       if ["$(expr substr $(uname -s) 1 10)"=="MINGW32_NT"];then
        echo -e "\033[不支持当前系统 \033[0m"
        exit
        fi
    fi


projectName="$1"
className="$2"
mkdir -p $projectName
cd $projectName
touch "$className.cpp"

task='ewogICAgLy8gU2VlIGh0dHBzOi8vZ28ubWljcm9zb2Z0LmNvbS9md2xpbmsvP0xpbmtJZD03MzM1NTgKICAgIC8vIGZvciB0aGUgZG9jdW1lbnRhdGlvbiBhYm91dCB0aGUgdGFza3MuanNvbiBmb3JtYXQKICAgICJ2ZXJzaW9uIjogIjIuMC4wIiwKICAgICJ0YXNrcyI6IFsKICAgICAgICB7CiAgICAgICAgICAgICJsYWJlbCI6ICJCdWlsZCAgICAgICAgIC0tJmd0OyZndDvnvJbor5Hpobnnm64iLAogICAgICAgICAgICAidHlwZSI6ICJzaGVsbCIsCiAgICAgICAgICAgICJvc3giOiB7CiAgICAgICAgICAgICAgICAiY29tbWFuZCI6ICJta2RpciAtcCBidWlsZDsgY2QgY21ha2VGaWxlcy87IG1ha2U7IG12IHJlbGVhc2VfKiAuLi9idWlsZC8iCiAgICAgICAgICAgIH0sCiAgICAgICAgICAgICJsaW51eCI6IHsKICAgICAgICAgICAgICAgICJjb21tYW5kIjogIm1rZGlyIC1wIGJ1aWxkOyBjZCBjbWFrZUZpbGVzLzsgbWFrZTsgbXYgcmVsZWFzZV8qIC4uL2J1aWxkLyIKICAgICAgICAgICAgfSwKICAgICAgICAgICAgImdyb3VwIjogImJ1aWxkIiwKICAgICAgICAgICAgInByb2JsZW1NYXRjaGVyIjogW10KICAgICAgICB9LAogICAgICAgIHsKICAgICAgICAgICAgImxhYmVsIjogImNtYWtlICAgICAgICAgLS0mZ3Q7Jmd0O+aehOW7uumhueebriIsCiAgICAgICAgICAgICJ0eXBlIjogInNoZWxsIiwKICAgICAgICAgICAgIm9zeCI6IHsKICAgICAgICAgICAgICAgICJjb21tYW5kIjogIm1rZGlyIC1wIGNtYWtlRmlsZXM7IGNkIGNtYWtlRmlsZXM7IGNtYWtlIC4uIgogICAgICAgICAgICB9LAogICAgICAgICAgICAibGludXgiOiB7CiAgICAgICAgICAgICAgICAiY29tbWFuZCI6ICJta2RpciAtcCBjbWFrZUZpbGVzOyBjZCBjbWFrZUZpbGVzOyBjbWFrZSAuLiIKICAgICAgICAgICAgfSwKICAgICAgICAgICAgImdyb3VwIjogImJ1aWxkIiwKICAgICAgICAgICAgInByb2JsZW1NYXRjaGVyIjogW10KICAgICAgICB9LAogICAgICAgIHsKICAgICAgICAgICAgImxhYmVsIjogImNsZWFyICAgICAgICAgLS0mZ3Q7Jmd0O+a4heepuumhueebriIsCiAgICAgICAgICAgICJ0eXBlIjogInNoZWxsIiwKICAgICAgICAgICAgImNvbW1hbmQiOiAicm0iLAogICAgICAgICAgICAiYXJncyI6IFsKICAgICAgICAgICAgICAgICItcmYiLAogICAgICAgICAgICAgICAgImJ1aWxkLyIsCiAgICAgICAgICAgICAgICAiY21ha2VGaWxlcy8iCiAgICAgICAgICAgIF0sCiAgICAgICAgICAgICJncm91cCI6ICJidWlsZCIsCiAgICAgICAgICAgICJwcm9ibGVtTWF0Y2hlciI6IFtdCiAgICAgICAgfQogICAgXQp9'
setting='ewogICAgImNtYWtlLXRvb2xzLWhlbHBlci5jbWFrZV9kb3dubG9hZF9wYXRoIjogIi4vLmNtYWtlX2Rvd25sb2FkIiwKICAgICJ0ZXJtaW5hbC5pbnRlZ3JhdGVkLmN1cnNvckJsaW5raW5nIjogdHJ1ZSwKICAgICJjbWFrZS5jb25maWd1cmVPbk9wZW4iOiB0cnVlLAogICAgIndvcmtiZW5jaC5jb2xvclRoZW1lIjogIkRlZmF1bHQgTGlnaHQrIiwKICAgICJ3b3JrYmVuY2guaWNvblRoZW1lIjogImVxLW1hdGVyaWFsLXRoZW1lLWljb25zLWRhcmtlciIsCiAgICAiZXhwbG9yZXIuY29uZmlybURlbGV0ZSI6IGZhbHNlLAogICAgIkNfQ3BwLmRlZmF1bHQuaW5jbHVkZVBhdGgiOiBbCiAgICAgICAgIiR7d29ya3NwYWNlRm9sZGVyfSIsCiAgICAgICAgIi91c3IvbG9jYWwvZW9zaW8uY2R0L2luY2x1ZGUiCiAgICBdCn0='
echo -e "\033[32m创建VSCode配置中 \033[0m"
mkdir -p .vscode
cd .vscode
echo "$task" | base64 -D >> "tasks.json"
echo "$setting" | base64 -D >> "settings.json"
cd ../
echo -e "\033[32m创建源文件中 \033[0m"
echo -e "#include <eosiolib/eosio.hpp>\r\r" >> "$className.cpp"
echo -e "using namespace eosio;\r" >> "$className.cpp"
echo -e "CONTRACT $className : public ::eosio::contract\r" >> "$className.cpp"
echo -e "{\r  public:\r    using contract::contract;\r    ACTION hi(){}\r};\rEOSIO_DISPATCH($className, (hi))" >> "$className.cpp"


echo -e "\033[32m创建CMakeLists.txt中 \033[0m"
touch 'CMakeLists.txt'
echo -e "cmake_minimum_required(VERSION 3.5)" >> 'CMakeLists.txt'
echo -e "project(empty VERSION 1.0.0)" >> 'CMakeLists.txt'
echo -e "find_package(eosio.cdt)" >> 'CMakeLists.txt'
echo -e "add_contract( $projectName release_$projectName $className.cpp )" >> 'CMakeLists.txt'

echo -e "\033[31m创建成功，是否打开在VSCode中？(yes/no) \033[0m"
read vscode
yes='yes'
if [ $vscode = $yes ] 
then code .
else exit
fi
else 
  echo 'EOS 命令不存在（cleos）' 
fi


