#!/bin/sh

# 格式化显示json 这个过程中会校验json合法性
jq . google.json
# 或者
cat google.json | jq .

# 通过key获取value 不存在会显示null
jq .name google.json

# 二层获取
jq '.location.state' google.json
jq '.employees[1].name' google.json

# 内建函数 key，has
jq 'keys' google.json
jq 'has("name")' google.json
jq 'has("noexisted")' google.json

# 如果json是一个字符串变量,可以像以下方式解析
json='{"name":"zhangsan"}'
echo $json | jq .name
