#!/usr/bin/env bash

# golang.org/x一键安装脚本

#为了兼容windows下的bash
cd $GOPATH;
#创建 $GOPATH/src/golang.org/x 目录
# 在win下,gopath读取可能会存在问题
mkdir -p $GOPATH/src/golang.org/x;

echo "已经安装的golang.org/x package";
ls;
echo "下面一行 for in 中包的名字您可以自己来定义"
for name in "glog" "image" "perf" "snappy" "term" "sync" "winstrap" "cwg" "leveldb" "text" "net" "build" "protobuf" "dep" "sys" "crypto" "gddo" "tools" "scratch" "proposal" "mock" "oauth2" "freetype" "debug" "mobile" "gofrontend" "lint" "appengine" "geo" "review" "arch" "vgo" "exp" "time";do
   cd $GOPATH/src/golang.org/x;
   if [ -d "$name" ]
   then
     cd $name;
     echo $name "包已经存在,使用git pull来更新源码";
     git pull;
   else
     git_url="https://github.com/golang/${name}.git";
     echo "开始clone golang.org/x 在github.com上的镜像代码:${git_url}";
     git clone --depth 1 "$git_url";
     cd $name;
   fi
   
   #如果 只import包 就不需要, 如果想使用调用他的二进制可执行文件就要go intall ,编译man函数到$GOBIN目录
   #go install;
done