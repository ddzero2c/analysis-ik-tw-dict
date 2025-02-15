#!/bin/bash

# 建立輸出檔案
output_file="tpe-mrt.txt"
> "$output_file"

# 寫入路線名稱

# 淡水信義線
echo "淡水信義線" >> "$output_file"
echo "紅線" >> "$output_file"
echo "淡水線" >> "$output_file"

# 板南線
echo "板南線" >> "$output_file"
echo "藍線" >> "$output_file"

# 松山新店線
echo "松山新店線" >> "$output_file"
echo "綠線" >> "$output_file"
echo "松山線" >> "$output_file"
echo "新店線" >> "$output_file"

# 中和新蘆線
echo "中和新蘆線" >> "$output_file"
echo "橘線" >> "$output_file"
echo "中和線" >> "$output_file"
echo "新蘆線" >> "$output_file"

# 文湖線
echo "文湖線" >> "$output_file"
echo "棕線" >> "$output_file"

# 環狀線
echo "環狀線" >> "$output_file"
echo "黃線" >> "$output_file"

# 淡水信義線站名
for station in "淡水" "紅樹林" "竹圍" "關渡" "忠義" "復興崗" "北投" "奇岩" "唭哩岸" "石牌" "明德" "芝山" "士林" "劍潭" "圓山" "民權西路" "雙連" "中山" "台北車站" "台大醫院" "中正紀念堂" "東門" "大安" "信義安和" "台北101/世貿" "象山"; do
    echo "$station" >> "$output_file"
    echo "${station}站" >> "$output_file"
    echo "${station}捷運站" >> "$output_file"
    echo "捷運${station}站" >> "$output_file"
done

# 板南線站名
for station in "頂埔" "永寧" "土城" "海山" "亞東醫院" "府中" "板橋" "新埔" "江子翠" "龍山寺" "西門" "台北車站" "善導寺" "忠孝新生" "忠孝復興" "忠孝敦化" "國父紀念館" "市政府" "永春" "後山埤" "昆陽" "南港" "南港展覽館"; do
    echo "$station" >> "$output_file"
    echo "${station}站" >> "$output_file"
    echo "${station}捷運站" >> "$output_file"
    echo "捷運${station}站" >> "$output_file"
done

# 松山新店線站名
for station in "新店" "新店區公所" "七張" "小碧潭" "大坪林" "景美" "萬隆" "公館" "台電大樓" "古亭" "中正紀念堂" "小南門" "西門" "北門" "中山" "松江南京" "南京復興" "台北小巨蛋" "南京三民" "松山"; do
    echo "$station" >> "$output_file"
    echo "${station}站" >> "$output_file"
    echo "${station}捷運站" >> "$output_file"
    echo "捷運${station}站" >> "$output_file"
done

# 中和新蘆線站名
for station in "蘆洲" "三民高中" "徐匯中學" "三和國中" "三重國小" "大橋頭" "民權西路" "中山國小" "行天宮" "松江南京" "忠孝新生" "東門" "古亭" "頂溪" "永安市場" "景安" "南勢角"; do
    echo "$station" >> "$output_file"
    echo "${station}站" >> "$output_file"
    echo "${station}捷運站" >> "$output_file"
    echo "捷運${station}站" >> "$output_file"
done

# 文湖線站名
for station in "動物園" "木柵" "萬芳社區" "萬芳醫院" "辛亥" "麟光" "六張犁" "科技大樓" "大安" "忠孝復興" "南京復興" "中山國中" "松山機場" "大直" "劍南路" "西湖" "港墘" "文德" "內湖" "大湖公園" "葫洲" "東湖" "南港軟體園區" "南港展覽館"; do
    echo "$station" >> "$output_file"
    echo "${station}站" >> "$output_file"
    echo "${station}捷運站" >> "$output_file"
    echo "捷運${station}站" >> "$output_file"
done

# 環狀線站名
for station in "大坪林" "十四張" "秀朗橋" "景平" "景安" "中和" "橋和" "中原" "板新" "板橋" "新埔民生" "頭前庄" "幸福" "新北產業園區"; do
    echo "$station" >> "$output_file"
    echo "${station}站" >> "$output_file"
    echo "${station}捷運站" >> "$output_file"
    echo "捷運${station}站" >> "$output_file"
done

# 排序並去重
sort -u -o "$output_file" "$output_file"

echo "已生成 $output_file"
