#!/bin/bash

# https://odportal.tw/dataset/kkG9Z3Nz
input_file="taiwan-roads.csv"
output_file="taiwan-roads.txt"
temp_file="temp.txt"
temp_file2="temp2.txt"

# 檢查 CSV 檔案是否存在
if [ ! -f "$input_file" ]; then
    wget https://cdn.odportal.tw/api/v1/resource/kkG9Z3Nz/619c52759cc8d000230432fd -O "$input_file"
fi

# 清空暫存檔
> "$temp_file"
> "$temp_file2"

# 處理縣市變體
tail -n +2 "$input_file" | cut -d, -f1 | tr -d '"' | tr -d ' ' | sort -u | xargs -I {} sh -c 'echo {}; [[ "{}" =~ [市縣]$ ]] && echo "{}"|sed "s/.$//;"' >> "$temp_file"

# 處理鄉鎮市區變體
tail -n +2 "$input_file" | cut -d, -f2 | tr -d '"' | tr -d ' ' | sort -u | xargs -I {} sh -c 'echo {}; [[ "{}" =~ [市鎮區鄉]$ ]] && echo "{}"|sed "s/.$//;"' >> "$temp_file"

# 處理路名（不處理變體）
tail -n +2 "$input_file" | cut -d, -f3 | tr -d '"' | tr -d ' ' | sort -u >> "$temp_file"

# 第一階段排序去重
cat "$temp_file" | sort -u  | tr -d '\r' > "$temp_file2"
cat "$temp_file" | sort -u  | tr -d '\r' | tr '台' '臺' >> "$temp_file2"
cat "$temp_file" | sort -u  | tr -d '\r' | tr '臺' '台' >> "$temp_file2"


# 最終排序去重
cat "$temp_file2" | sort -u > "$output_file"

# 清理暫存檔
rm "$temp_file" "$temp_file2"

echo "已生成 $output_file"
