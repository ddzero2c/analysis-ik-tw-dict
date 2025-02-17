#!/bin/bash

# https://odportal.tw/dataset/kkG9Z3Nz
opendata="tw-roads-opendata.csv"
district="tw-district.txt"
road="tw-road.txt"

# 檢查 CSV 檔案是否存在
if [ ! -f "$opendata" ]; then
    wget https://cdn.odportal.tw/api/v1/resource/kkG9Z3Nz/619c52759cc8d000230432fd -O "$opendata"
fi

tmp=$(mktemp)
tail -n +2 "$opendata" | cut -d, -f1 | sort -u > $tmp
tail -n +2 "$opendata" | cut -d, -f1 | sort -u | tr  -d "縣市" >> $tmp

tail -n +2 "$opendata" | cut -d, -f2 | sort -u >> $tmp #臺北市大安區
tail -n +2 "$opendata" | cut -d, -f2 | sort -u | tr  -d "縣市" >> $tmp #臺北大安區
tail -n +2 "$opendata" | cut -d, -f2 | sort -u | tr  -d "縣市" | sed '/^.\{5,\}$/s/\(.*\)./\1/' | sort -u >> $tmp #臺北大安
tail -n +2 "$opendata" | cut -d, -f2 | sort -u | sed '/^.\{6,\}$/s/\(.*\)./\1/' | sort -u >> $tmp #臺北市大安
tail -n +2 "$opendata" | cut -d, -f2 | cut -c 4- | sort -u >> $tmp #大安區
tail -n +2 "$opendata" | cut -d, -f2 | cut -c 4- | sed '/^.\{3,\}$/s/\(.*\)./\1/' | sort -u >> $tmp #大安

tai=$(mktemp)
cat $tmp | tr "臺" "台" > $tai
cat $tmp $tai | sort -u > $district
echo "已生成 $district"

tail -n +2 "$opendata" | cut -d, -f3 | sort -u > $tmp
cat $tmp | tr "臺" "台" > $tai
cat $tmp $tai | sort -u > $road
echo "已生成 $road"

