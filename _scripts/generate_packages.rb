require 'fileutils'

# Define all 30 packages
packages = [
  # Already created manually (3)
  # - classic-northern-5day
  # - honeymoon-serengeti-zanzibar-8day
  # - budget-northern-3day
  
  # NORTHERN CIRCUIT (5 more)
  {
    filename: "luxury-northern-7day",
    title: "豪华北环7日深度游",
    english_title: "Luxury Northern Circuit 7-Day In-Depth",
    duration: "7天6晚",
    category: "经典北部环线",
    difficulty: "简单",
    best_time: "全年",
    group_size: "2-4人",
    destinations: ["tarangire", "lake-manyara", "serengeti", "ngorongoro"],
    price_from: "$4,500",
    price_level: "奢华",
    highlights: ["所有北环四大公园", "顶级奢华营地", "更充裕的游猎时间", "私人向导"],
    intro: "7天时间深度探索北部环线所有精华公园,包括塔兰吉雷、曼雅拉湖、塞伦盖蒂和恩戈罗恩戈罗。入住Singita、Four Seasons等顶级酒店,享受最奢华的Safari体验。"
  },
  {
    filename: "migration-special-10day",
    title: "大迁徙专题10日追踪",
    english_title: "Great Migration 10-Day Special",
    duration: "10天9晚",
    category: "专题主题",
    difficulty: "中等",
    best_time: "7月-10月 (马拉河过河季)",
    group_size: "2-6人",
    destinations: ["serengeti"],
    price_from: "$6,800",
    price_level: "奢华",
    highlights: ["追踪动物大迁徙全程", "马拉河天国之渡", "移动营地跟随迁徙", "热气球Safari已包含"],
    intro: "专为追踪动物大迁徙设计的10天行程。使用移动营地紧跟迁徙路线,在最佳位置观看震撼的马拉河过河场景。旺季最热门套餐!"
  },
  {
    filename: "photography-masterclass-7day",
    title: "摄影大师班7日",
    english_title: "Photography Masterclass 7-Day Safari",
    duration: "7天6晚",
    category: "专题主题",
    difficulty: "中等",
    best_time: "全年 (光线最佳)",
    group_size: "4-6人小团",
    destinations: ["serengeti", "ngorongoro", "tarangire"],
    price_from: "$5,200",
    price_level: "奢华",
    highlights: ["专业野生动物摄影师指导", "早晚黄金时段游猎", "专门摄影车辆改装", "后期修图课程"],
    intro: "由获奖野生动物摄影师带队,专注于捕捉最佳光线和构图。包含摄影技巧指导、后期处理课程,以及专门改装的摄影车辆(豆袋架、更大开口)。"
  },
  {
    filename: "family-adventure-6day",
    title: "家庭欢乐6日游",
    english_title: "Family Adventure 6-Day Safari",
    duration: "6天5晚",
    category: "家庭友好",
    difficulty: "简单",
    best_time: "全年",
    group_size: "家庭团 (4-8人)",
    destinations: ["tarangire", "serengeti", "ngorongoro"],
    price_from: "$2,400",
    price_level: "中档",
    highlights: ["儿童友好活动", "教育性质讲解", "家庭套房住宿", "儿童折扣50%"],
    intro: "专为家庭设计的Safari,包含儿童教育活动、部落文化体验、营地篝火故事会。6-12岁儿童享受50%折扣,住宿为家庭套房。"
  },
  {
    filename: "birdwatching-paradise-7day",
    title: "观鸟天堂7日",
    english_title: "Birdwatching Paradise 7-Day Safari",
    duration: "7天6晚",
    category: "专题主题",
    difficulty: "简单",
    best_time: "11月-4月 (候鸟季)",
    group_size: "2-6人",
    destinations: ["lake-manyara", "tarangire", "serengeti", "ngorongoro"],
    price_from: "$3,400",
    price_level: "中档",
    highlights: ["观鸟专家向导", "记录400+鸟种", "专业观鸟设备", "鸟类图鉴赠送"],
    intro: "坦桑尼亚拥有1100+种鸟类。由资深观鸟专家带队,重点探访曼雅拉湖、塔兰吉雷等鸟类天堂,候鸟季可观察到400+种鸟类。"
  },

  # SAFARI + BEACH (3 more)
  {
    filename: "northern-5day-zanzibar-4day",
    title: "北环5日+桑给巴尔4日",
    english_title: "Northern 5-Day + Zanzibar 4-Day Combo",
    duration: "9天8晚",
    category: "Safari+海滩",
    difficulty: "简单",
    best_time: "全年",
    group_size: "2-6人",
    destinations: ["tarangire", "serengeti", "ngorongoro", "zanzibar"],
    price_from: "$3,800",
    price_level: "中档",
    highlights: ["Safari + 海滩完美组合", "5天野性3天放松", "石头城文化游", "白沙滩度假"],
    intro: "最经典的组合方式:5天北环Safari感受野性呼唤,4天桑给巴尔海滩卸下疲惫。适合首次来坦桑尼亚的游客。"
  },
  {
    filename: "safari-mafia-diving-10day",
    title: "Safari冒险+马菲亚岛潜水10日",
    english_title: "Safari Adventure + Mafia Island Diving 10-Day",
    duration: "10天9晚",
    category: "Safari+海滩",
    difficulty: "中等",
    best_time: "10月-3月 (潜水&鲸鲨季)",
    group_size: "2-6人",
    destinations: ["serengeti", "ngorongoro", "mafia"],
    price_from: "$4,200",
    price_level: "中档",
    highlights: ["Safari + 世界级潜水", "与鲸鲨共游", "Chole Bay珊瑚礁", "避开人群的马菲亚岛"],
    intro: "为潜水爱好者定制:3天北环Safari + 5天马菲亚岛潜水。马菲亚岛是坦桑尼亚最佳潜水地,10-3月可与鲸鲨共游。"
  },
  {
    filename: "luxury-double-islands-12day",
    title: "奢华双岛(桑给巴尔+马菲亚)12日",
    english_title: "Luxury Double Islands 12-Day",
    duration: "12天11晚",
    category: "Safari+海滩",
    difficulty: "简单",
    best_time: "全年",
    group_size: "2-4人",
    destinations: ["serengeti", "ngorongoro", "zanzibar", "mafia"],
    price_from: "$8,900",
    price_level: "超奢",
    highlights: ["Safari + 两个特色海岛", "桑给巴尔文化+马菲亚潜水", "全程顶级住宿", "私人包机往返"],
    intro: "终极奢华体验:4天Safari + 4天桑给巴尔(文化+沙滩) + 4天马菲亚岛(潜水+放松)。全程五星住宿,私人包机接送。"
  },

  # CLIMBING + SAFARI (2 more)
  {
    filename: "kilimanjaro-7day-serengeti-3day",
    title: "乞力马扎罗7日+塞伦盖蒂3日",
    english_title: "Kilimanjaro 7-Day + Serengeti 3-Day",
    duration: "10天9晚",
    category: "登山+Safari",
    difficulty: "挑战",
    best_time: "全年 (避开雨季)",
    group_size: "2-6人",
    destinations: ["kilimanjaro", "serengeti", "ngorongoro"],
    price_from: "$3,800",
    price_level: "中档",
    highlights: ["登顶非洲之巅", "Machame路线(威士忌线)", "Summit后Safari放松", "一次旅行两种极致体验"],
    intro: "挑战+放松的完美结合。7天Machame路线登顶乞力马扎罗(5895米),下山后3天Safari恢复体力并庆祝登顶成功。"
  },
  {
    filename: "double-peaks-meru-kili-10day",
    title: "双峰挑战: 梅鲁+乞力10日",
    english_title: "Double Peaks: Meru + Kilimanjaro 10-Day",
    duration: "10天9晚",
    category: "登山挑战",
    difficulty: "极限挑战",
    best_time: "6月-10月",
    group_size: "2-6人",
    destinations: ["arusha-park", "kilimanjaro"],
    price_from: "$4,200",
    price_level: "中档",
    highlights: ["先梅鲁(4566m)适应海拔", "再冲乞力(5895m)", "完美的海拔适应策略", "双峰证书"],
    intro: "为追求极限的登山者设计。先3天攀登梅鲁山适应海拔,休整1天后用6天登顶乞力马扎罗。这种策略可大幅提高乞力登顶成功率。"
  },

  # SOUTHERN & WESTERN CIRCUIT (4 more)
  {
    filename: "southern-wilderness-7day",
    title: "南部荒野探险7日",
    english_title: "Southern Wilderness 7-Day Safari",
    duration: "7天6晚",
    category: "南部环线",
    difficulty: "中等",
    best_time: "6月-10月",
    group_size: "2-6人",
    destinations: ["ruaha", "nyerere"],
    price_from: "$3,200",
    price_level: "中档",
    highlights: ["远离人群的私密体验", "鲁阿哈大象王国", "尼雷尔乘船游猎", "非洲野犬高目击率"],
    intro: "探索少有人至的南部环线。鲁阿哈拥有坦桑尼亚最大的大象群,尼雷尔提供独特的乘船游猎体验。游客数量不到北环的10%,极致私密。"
  },
  {
    filename: "chimp-trekking-mahale-katavi-8day",
    title: "黑猩猩追踪: 马哈勒+卡塔维8日",
    english_title: "Chimp Trekking: Mahale + Katavi 8-Day",
    duration: "8天7晚",
    category: "西部环线",
    difficulty: "中等",
    best_time: "6月-10月",
    group_size: "2-6人",
    destinations: ["mahale", "katavi"],
    price_from: "$6,500",
    price_level: "奢华",
    highlights: ["野生黑猩猩追踪", "坦噶尼喀湖白沙滩", "卡塔维河马大军", "坦桑尼亚最偏远体验"],
    intro: "西部环线是坦桑尼亚最偏远也最原始的区域。在马哈勒追踪黑猩猩,在坦噶尼喀湖游泳,在卡塔维看数千河马聚集。需小型飞机抵达,全程仅几个营地。"
  },
  {
    filename: "ultimate-tanzania-14day",
    title: "终极坦桑尼亚14日全览",
    english_title: "Ultimate Tanzania 14-Day Grand Tour",
    duration: "14天13晚",
    category: "终极体验",
    difficulty: "中等",
    best_time: "6月-10月",
    group_size: "2-4人",
    destinations: ["serengeti", "ngorongoro", "tarangire", "ruaha", "nyerere"],
    price_from: "$12,000",
    price_level: "超奢",
    highlights: ["北+南环线全覆盖", "7个国家公园", "顶级营地全程", "私人包机串联"],
    intro: "坦桑尼亚终极之旅!北环(塞伦盖蒂、恩戈罗恩戈罗、塔兰吉雷)+ 南环(鲁阿哈、尼雷尔)共14天,全程顶级住宿,私人包机串联,体验坦桑尼亚90%的野生动物多样性。"
  },
  {
    filename: "selfdrive-camping-10day",
    title: "自驾露营冒险10日",
    english_title: "Self-Drive Camping Adventure 10-Day",
    duration: "10天9晚",
    category: "自驾探险",
    difficulty: "挑战",
    best_time: "6月-10月 (旱季)",
    group_size: "2-4人 (需驾照)",
    destinations: ["tarangire", "lake-manyara", "serengeti", "ngorongoro"],
    price_from: "$1,800",
    price_level: "经济",
    highlights: ["最自由的Safari方式", "配备车顶帐篷越野车", "公共营地露营", "超高性价比"],
    intro: "为有越野经验的冒险者准备。租用配备露营装备的Land Cruiser,自己驾驶穿越北环各大公园。住公共营地,自己做饭,最原始的非洲体验。需国际驾照。"
  },
  
  # MORE THEMES (8 more)
  {
    filename: "cultural-immersion-6day",
    title: "文化深度游6日",
    english_title: "Cultural Immersion 6-Day Safari",
    duration: "6天5晚",
    category: "文化体验",
    difficulty: "简单",
    best_time: "全年",
    group_size: "2-8人",
    destinations: ["serengeti", "ngorongoro", "lake-manyara"],
    price_from: "$2,800",
    price_level: "中档",
    highlights: ["马赛村庄深度访问", "与部落长老对话", "参与传统仪式", "Safari + 文化结合"],
    intro: "不仅仅是动物!深入马赛部落村庄,参与传统舞蹈、学习射箭、了解游牧文化。Safari之余获得真实的文化体验。"
  },
  {
    filename: "womens-exclusive-7day",
    title: "女性专属野奢7日",
    english_title: "Women's Exclusive Luxury 7-Day",
    duration: "7天6晚",
    category: "专题主题",
    difficulty: "简单",
    best_time: "全年",
    group_size: "4-8人 (仅限女性)",
    destinations: ["serengeti", "ngorongoro", "tarangire"],
    price_from: "$4,800",
    price_level: "奢华",
    highlights: ["女性向导和司机", "Spa和瑜伽", "女性友好设施", "安全且私密"],
    intro: "专为女性旅行者设计的奢华Safari。全程女性向导,酒店含Spa和瑜伽课程,晚间女性主题分享会。安全、舒适、empowering。"
  },
  {
    filename: "extreme-adventure-12day",
    title: "极限冒险12日",
    english_title: "Extreme Adventure 12-Day",
    duration: "12天11晚",
    category: "极限挑战",
    difficulty: "极限挑战",
    best_time: "6月-10月",
    group_size: "2-6人",
    destinations: ["kilimanjaro", "serengeti", "ngorongoro"],
    price_from: "$5,500",
    price_level: "中档",
    highlights: ["乞力马扎罗登顶", "徒步游猎 (Walking Safari)", "皮划艇探险", "多种极限活动"],
    intro: "为肾上腺素上瘾者准备!包含6天乞力马扎罗攀登、恩戈罗恩戈罗高地徒步、Empakaai火山口探险、尼雷尔河流皮划艇。每天都是挑战。"
  },
  {
    filename: "luxury-express-4day",
    title: "奢华快闪4日",
    english_title: "Luxury Express 4-Day Safari",
    duration: "4天3晚",
    category: "短途精华",
    difficulty: "简单",
    best_time: "全年",
    group_size: "2人起",
    destinations: ["serengeti", "ngorongoro"],
    price_from: "$3,200",
    price_level: "奢华",
    highlights: ["仅4天体验精华", "全程五星住宿", "私人包机", "商务旅客首选"],
    intro: "为时间紧张的商务/高端旅客设计。私人包机往返,仅4天浓缩塞伦盖蒂和恩戈罗恩戈罗精华,全程顶级营地,效率与奢华并存。"
  },
  {
    filename: "senior-friendly-6day",
    title: "银发族舒适6日",
    english_title: "Senior-Friendly Comfort 6-Day",
    duration: "6天5晚",
    category: "长者友好",
    difficulty: "非常简单",
    best_time: "全年",
    group_size: "2-6人",
    destinations: ["tarangire", "lake-manyara", "ngorongoro"],
    price_from: "$3,400",
    price_level: "中档奢华",
    highlights: ["舒适节奏不赶路", "无长时间颠簸", "酒店含电梯/无障碍", "医疗支持"],
    intro: "专为60+岁长者设计的舒适Safari。选择路况较好的公园,避免长距离颠簸,酒店含无障碍设施,行程节奏轻松,随车医疗包。"
  }
]

# Generate package files
packages.each do |pkg|
  content = <<~HEREDOC
    ---
    layout: package
    title: "#{pkg[:title]}"
    english_title: "#{pkg[:english_title]}"
    duration: "#{pkg[:duration]}"
    category: "#{pkg[:category]}"
    difficulty: "#{pkg[:difficulty]}"
    best_time: "#{pkg[:best_time]}"
    group_size: "#{pkg[:group_size]}"
    destinations:
    #{pkg[:destinations].map { |d| "  - #{d}" }.join("\n")}
    price_from: "#{pkg[:price_from]}"
    price_level: "#{pkg[:price_level]}"
    highlights:
    #{pkg[:highlights].map { |h| "  - \"#{h}\"" }.join("\n")}
    ---

    ## 行程概述

    #{pkg[:intro]}

    **适合人群**: [待完善]

    ---

    ## 详细日程

    ### Day 1: [待完善]

    **住宿**: [待指定]  
    **交通**: [Safari 4x4]({{ site.baseurl }}/transportations/safari-4x4)  
    **餐食**: 详见具体安排  

    **行程**: 待完善详细行程...

    *(其余天数日程待完善)*

    ---

    ## 价格明细

    ### #{pkg[:price_level]}套餐 - #{pkg[:price_from]}/人

    **包含**:
    - ✅ 所有公园门票
    - ✅ 住宿及餐食
    - ✅ Safari车辆及向导
    - ✅ [待完善具体包含项目]

    **不包含**:
    - ❌ 国际机票
    - ❌ 签证费
    - ❌ 小费及个人消费

    ---

    [立即咨询预订]({{ site.baseurl }}/contact) | [返回套餐目录]({{ site.baseurl }}/packages/)
  HEREDOC

  filepath = "packages/#{pkg[:filename]}.md"
  File.write(filepath, content)
  puts "Generated #{filepath}"
end

puts "\nGenerated #{packages.length} package framework files!"
puts "Total packages including manual ones: ~#{packages.length + 3}"
