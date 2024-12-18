#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Aggregate Search
# @raycast.mode silent
# @raycast.packageName WN Personal

# Optional parameters:
# @raycast.icon images/aggregate-search.png
# @raycast.argument1 { "type": "text", "placeholder": "query", "percentEncoded": true }
# @raycast.argument2 { "type": "dropdown", "placeholder": "默认 4", "optional": true, "data": [{"title": "1", "value": "1"}, {"title": "2", "value": "2"}, {"title": "3", "value": "3"}, {"title": "4", "value": "4"}] }

# 默认搜索引擎数组
engines=("perplexity" "metaso" "monica" "google")

# 确定要取的搜索引擎数量
count=4
if [ ! -z "$2" ]; then
    count=$2
fi

# 创建新的数组，只包含前 count 个元素
engines=("${engines[@]:0:$count}")

# 遍历搜索引擎数组执行搜索
for engine in "${engines[@]}"; do
    case "$engine" in
        "perplexity")
            open "https://www.perplexity.ai/?q=$1"
            ;;
        "metaso")
            open "https://metaso.cn/?q=$1"
            ;;
        "monica")
            open "https://monica.so/answers/?q=$1&pro=1"
            ;;
        "google")
            open "https://www.google.com/search?q=$1"
            ;;
    esac
done
