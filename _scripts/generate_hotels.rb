require 'fileutils'

# Comprehensive list of ~50 Hotels
hotels = [
  # --- SERENGETI ---
  {
    title: "Singita Sasakwa Lodge",
    english_title: "Singita Sasakwa Lodge",
    category: "顶级奢华 (Ultra Luxury)",
    region: "Serengeti",
    location: "Grumeti Reserve (Western Serengeti)",
    price_level: "$$$$$ ($2000+/night)",
    filename: "singita-sasakwa",
    amenities: ["私人无边泳池", "马术中心", "网球场", "专属管家", "米其林级餐饮"],
    intro: "Singita Sasakwa 是一座建在山顶的爱德华时代庄园，俯瞰着广阔的 Grumeti 保护区。这里代表了东非游猎的最高水准，拥有无可比拟的奢华与私密性。"
  },
  {
    title: "Namiri Plains",
    english_title: "Asilia Namiri Plains",
    category: "野奢帐篷 (Luxury Camp)",
    region: "Serengeti",
    location: "Eastern Serengeti",
    price_level: "$$$$ ($1000+/night)",
    filename: "namiri-plains",
    amenities: ["大猫观测圣地", "私人户外浴缸", "摄影工作室", "篝火晚会"],
    intro: "Namiri Plains 所在的区域曾经为了保护猎豹而封锁了20年。如今重新开放，这里是整个塞伦盖蒂寻找猎豹和狮群的最佳地点。"
  },
  {
    title: "Serengeti Bushtops",
    english_title: "Serengeti Bushtops Camp",
    category: "奢华帐篷 (Luxury Tent)",
    region: "Serengeti",
    location: "Northern Serengeti",
    price_level: "$$$$$ ($1500+/night)",
    filename: "serengeti-bushtops",
    amenities: ["24小时私人管家", "私人热水浴缸 (Hot Tub)", "顶级酒窖", "可变敞篷帐篷"],
    intro: "被誉为'最狂野的奢华'。每个帐篷都配有巨大的私人甲板和热水浴缸，是观看大迁徙过河后休憩的绝佳场所。"
  },
  {
    title: "Lemala Nanyukie",
    english_title: "Lemala Nanyukie Lodge",
    category: "现代奢华 (Modern Luxury)",
    region: "Serengeti",
    location: "Central Serengeti",
    price_level: "$$$$ ($900+/night)",
    filename: "lemala-nanyukie",
    amenities: ["私人泳池", "现代设计风格", "儿童俱乐部", "水疗中心"],
    intro: "Lemala Nanyukie 以其现代化的设计和巨大的玻璃落地窗闻名，位于大型猫科动物密集的区域。"
  },
  {
    title: "Sayari Camp",
    english_title: "Asilia Sayari Camp",
    category: "野奢帐篷 (Luxury Camp)",
    region: "Serengeti",
    location: "Northern Serengeti (Mara River)",
    price_level: "$$$$ ($1100+/night)",
    filename: "sayari-camp",
    amenities: ["泳池", "微型啤酒厂", "绝佳过河观测点", "岩石泳池"],
    intro: "Sayari 曾被评为'全球最佳酒店'之一。它靠近马拉河，是等待角马天国之渡的黄金据点，同时拥有非洲野外少见的微型啤酒酿造厂。"
  },
  {
      title: "Singita Faru Faru",
      english_title: "Singita Faru Faru Lodge",
      category: "顶级野奢",
      region: "Serengeti",
      location: "Grumeti Reserve",
      price_level: "$$$$$ ($2000+/night)",
      filename: "singita-faru-faru",
      amenities: ["私人沙滩", "Grumeti河景", "无边泳池", "顶级酒窖"],
      intro: "Singita Faru Faru 采用现代非洲设计，位于私人保护区内，提供极致的隐秘和独家游猎体验。"
  },
  {
      title: "Melia Serengeti",
      english_title: "Melia Serengeti Lodge",
      category: "现代豪华",
      region: "Serengeti",
      location: "Central Serengeti",
      price_level: "$$$ ($500+/night)",
      filename: "melia-serengeti",
      amenities: ["无边泳池", "儿童俱乐部", "健身中心", "俯瞰Nyamuma山"],
      intro: "Melia Serengeti 提供五星级的现代舒适设施，位置优越，俯瞰Mbalageti河谷。"
  },
  {
      title: "Singita Sabora",
      english_title: "Singita Sabora Tented Camp",
      category: "复古野奢",
      region: "Serengeti",
      location: "Grumeti Reserve",
      price_level: "$$$$$ ($2000+/night)",
      filename: "singita-sabora",
      amenities: ["网球场", "健身中心", "复古探险风格", "私人管家"],
      intro: "重现了1920年代的探险风格，Singita Sabora 将复古情怀与顶级奢华完美结合。"
  },
  {
      title: "Lamai Serengeti",
      english_title: "Nomad Lamai Serengeti",
      category: "野奢山居",
      region: "Serengeti",
      location: "Northern Serengeti",
      price_level: "$$$$ ($1000+/night)",
      filename: "lamai-serengeti",
      amenities: ["Kogakuria Kopje岩石上", "全景视野", "泳池"],
      intro: "建在Kogakuria Kopje巨大的岩石之上，俯瞰整个北部塞伦盖蒂平原和马拉河，视野无敌。"
  },
  { title: "Mwiba Lodge", english_title: "Mwiba Lodge", category: "隐秘奢华", region: "Serengeti", location: "Southern Serengeti", price_level: "$$$$$", filename: "mwiba-lodge", amenities: ["私人保护区", "夜间游猎", "步须曼人体验"], intro: "位于塞伦盖蒂南部的私人野生动物保护区，提供极致私密的游猎体验。" },
  { title: "One Nature Nyaruswiga", english_title: "One Nature Nyaruswiga", category: "奢华帐篷", region: "Serengeti", location: "Central Serengeti", price_level: "$$$$", filename: "one-nature-nyaruswiga", amenities: ["无边泳池", "豪华浴缸", "观星台"], intro: "位于塞伦盖蒂中心，被群山环绕，是观赏大猫的绝佳地点。" },
  { title: "Roving Bushtops", english_title: "Roving Bushtops Camp", category: "移动营地", region: "Serengeti", location: "Mobile (Migration)", price_level: "$$$$", filename: "roving-bushtops", amenities: ["移动奢华", "私人管家", "大迁徙跟随"], intro: "这不仅是一个帐篷，这是一座移动的宫殿。它随着动物大迁徙的脚步移动，确保你永远处于最佳观赏位置。" },
    { title: "Grumeti River Lodge", english_title: "&Beyond Grumeti Serengeti River Lodge", category: "奢华河景", region: "Serengeti", location: "Western Serengeti", price_level: "$$$$", filename: "grumeti-river-lodge", amenities: ["河马池景观", "现代设计", "家庭套房"], intro: "坐落在格鲁米法河支流的河岸上，你可以直接在餐厅看到河马在水中嬉戏。" },
    { title: "Serengeti Pioneer Camp", english_title: "Elewana Serengeti Pioneer Camp", category: "怀旧经典", region: "Serengeti", location: "South Central Serengeti", price_level: "$$$", filename: "serengeti-pioneer-camp", amenities: ["Kopjes景观", "30年代风格", "岩石泳池"], intro: "旨在向早期的非洲探险家致敬，营地充满了复古的浪漫气息。" },
    { title: "Kubu Kubu Tented Lodge", english_title: "Kubu Kubu Tented Lodge", category: "豪华帐篷", region: "Serengeti", location: "Central Serengeti", price_level: "$$$", filename: "kubu-kubu-lodge", amenities: ["大型泳池", "山顶视野", "热气球基地"], intro: "拥有塞伦盖蒂中部最大的游泳池之一，且地理位置极佳，方便前往各个游猎区域。" },
    { title: "Taasa Lodge", english_title: "Taasa Lodge", category: "私人领地", region: "Serengeti", location: "Northern Serengeti (Klein's Gate)", price_level: "$$$$", filename: "taasa-lodge", amenities: ["夜间游猎", "越野驾驶", "步行游猎"], intro: "位于塞伦盖蒂边界的私人特许权区域，可以进行国家公园内禁止的夜间游猎和徒步活动。" },
    { title: "Olakira Migration Camp", english_title: "Asilia Olakira Migration Camp", category: "移动营地", region: "Serengeti", location: "Mobile", price_level: "$$$$", filename: "olakira-camp", amenities: ["网状观星帐篷", "大迁徙跟随", "亲密体验"], intro: "最著名的是它的'观星帐篷'，你可以躺在床上，透过网状的帐篷顶看满天繁星。" },
    { title: "Sanctuary Kichakani", english_title: "Sanctuary Kichakani Serengeti Camp", category: "经典移动", region: "Serengeti", location: "Mobile", price_level: "$$$$", filename: "sanctuary-kichakani", amenities: ["复古探险风格", "私人露台", "极致服务"], intro: "重现了19世纪探险家的风格，随季节迁徙，从南部的短草平原到北部的马拉河。" },
    { title: "Soroi Serengeti Lodge", english_title: "Mbali Mbali Soroi Serengeti Lodge", category: "山顶景观", region: "Serengeti", location: "Western Corridor", price_level: "$$$", filename: "soroi-serengeti", amenities: ["悬空木栈道", "日落景观", "三层主楼"], intro: "建在巨大的岩石高原上，通过木栈道连接，拥有无敌的西部走廊景观。" },

  # --- NGORONGORO ---
  {
    title: "Ngorongoro Serena",
    english_title: "Ngorongoro Serena Safari Lodge",
    category: "经典豪华 (Classic Luxury)",
    region: "Ngorongoro",
    location: "Crater Rim",
    price_level: "$$$ ($500+/night)",
    filename: "ngorongoro-serena",
    amenities: ["石头建筑风格", "火山口全景阳台", "晚间传统表演", "靠近下山路口"],
    intro: "整座酒店由河石堆砌而成，完美融入火山口边缘。它的位置极佳，就在下山道路的旁边，能让你成为第一批进入火山口的游客。"
  },
  {
    title: "The Highlands",
    english_title: "Asilia The Highlands",
    category: "特色野奢 (Unique Luxury)",
    region: "Ngorongoro",
    location: "Olmoti Crater",
    price_level: "$$$$ ($900+/night)",
    filename: "the-highlands",
    amenities: ["球形穹顶帐篷", "燃木壁炉", "马赛文化探访", "Olmoti 火山徒步"],
    intro: "彻底颠覆传统的球形帐篷设计，位于更高海拔的 Olmoti 火山坡上，提供比一般火山口酒店更隐秘、更独特的体验。"
  },
  {
    title: "Gibb's Farm",
    english_title: "Gibb's Farm",
    category: "农庄奢华 (Farm House)",
    region: "Ngorongoro",
    location: "Karatu (Near Ngorongoro)",
    price_level: "$$$ ($600+/night)",
    filename: "gibbs-farm",
    amenities: ["有机农场", "咖啡种植园", "花园别墅", "农场直供餐饮"],
    intro: "这不仅仅是酒店，更是一个生机勃勃的有机农场。这里不仅是去往 Ngorongoro 的中转站，更是享受田园生活、品尝新鲜食材的天堂。"
  },
  {
    title: "Neptune Ngorongoro",
    english_title: "Neptune Ngorongoro Luxury Lodge",
    category: "舒适豪华 (Comfort Luxury)",
    region: "Ngorongoro",
    location: "Karatu",
    price_level: "$$$ ($500+/night)",
    filename: "neptune-ngorongoro",
    amenities: ["独栋木屋别墅", "壁炉", "巨大的游泳池", "全包式服务"],
    intro: "坐落在 50 英亩的咖啡种植园中，每间房都是带有温暖壁炉的独立木屋套房，性价比极高。"
  },
    { title: "Ngorongoro Manor", english_title: "Elewana The Manor at Ngorongoro", category: "庄园奢华", region: "Ngorongoro", location: "Karatu", price_level: "$$$$", filename: "ngorongoro-manor", amenities: ["荷兰角建筑风格", "骑马体验", "奢华庄园", "SPA"], intro: "它是坦桑尼亚最宏伟的建筑之一，仿佛将一座欧洲庄园搬到了非洲高地。" },
    { title: "Entamanu Ngorongoro", english_title: "Nomad Entamanu Ngorongoro", category: "避世营地", region: "Ngorongoro", location: "Crater Rim", price_level: "$$$$", filename: "entamanu-ngorongoro", amenities: ["双向景观(火山口/塞伦盖蒂)", "环保设计", "极度私密"], intro: "这是唯一一个能同时看到一侧是火山口，另一侧是塞伦盖蒂平原的营地。" },
    { title: "Plantation Lodge", english_title: "Plantation Lodge", category: "花园酒店", region: "Ngorongoro", location: "Karatu", price_level: "$$$", filename: "plantation-lodge", amenities: ["美丽花园", "精致餐饮", "家庭氛围"], intro: "像家一样温馨的酒店，每个房间都有不同的装饰风格，花园极其美丽。" },
    { title: "Oldeani Mountain Lodge", english_title: "Ngorongoro Oldeani Mountain Lodge", category: "山景酒店", region: "Ngorongoro", location: "Karatu", price_level: "$$$", filename: "oldeani-mountain-lodge", amenities: ["由于山顶视野", "无边泳池", "殖民风格"], intro: "拥有360度的无敌视野，可以远眺Oldeani火山和恩戈罗恩戈罗边缘。" },
    { title: "Sanctuary Crater Camp", english_title: "Sanctuary Ngorongoro Crater Camp", category: "经典帐篷", region: "Ngorongoro", location: "Crater Rim", price_level: "$$$$", filename: "sanctuary-crater-camp", amenities: ["位于火山口边缘", "清晨优先下山", "经典游猎风格"], intro: "地理位置极佳，让你能在清晨大部分游客到来之前抵达火山口底部。" },

  # --- TARANGIRE & ARUSHA & MANYARA ---
  {
    title: "Arusha Coffee Lodge",
    english_title: "Elewana Arusha Coffee Lodge",
    category: "庄园奢华 (Heritage)",
    region: "Arusha",
    location: "Arusha West",
    price_level: "$$$ ($450+/night)",
    filename: "arusha-coffee-lodge",
    amenities: ["咖啡庄园", "Shanga 工坊", "花园套房", "顶级餐厅"],
    intro: "隐藏在坦桑尼亚最大的咖啡种植园之一中。这里的空气中弥漫着咖啡香，是一次 Safai 旅行最优雅的起点或终点。"
  },
  {
    title: "Legendary Lodge",
    english_title: "Legendary Lodge Arusha",
    category: "殖民风格庄园 (Colonial)",
    region: "Arusha",
    location: "Arusha West",
    price_level: "$$$$ ($700+/night)",
    filename: "legendary-lodge",
    amenities: ["能看火山的花园", "私人管家", "网球场", "极致私密"],
    intro: "阿鲁沙最顶级的住宿之一，位于咖啡庄园深处，仅有几间殖民风格的小屋，服务细节令人惊叹。"
  },
    { title: "Rivertrees Country Inn", english_title: "Rivertrees Country Inn", category: "乡村旅馆", region: "Arusha", location: "Usa River", price_level: "$$", filename: "rivertrees-country-inn", amenities: ["河畔花园", "观鸟", "皮划艇", "乡村宁静"], intro: "位于前往机场的途中，是一个充满历史感和自然气息的乡村庄园，非常适合放松。" },
    { title: "Lake Duluti Lodge", english_title: "Lake Duluti Lodge", category: "湖畔奢华", region: "Arusha", location: "Lake Duluti", price_level: "$$$", filename: "lake-duluti-lodge", amenities: ["湖景", "独栋木屋", "有机农场"], intro: "这是阿鲁沙最宁静的角落，每间小屋都隐藏在古老的树林中，面朝杜鲁蒂湖。" },
    { title: "Kuro Tarangire", english_title: "Nomad Kuro Tarangire", category: "野趣营地", region: "Tarangire", location: "Tarangire Central", price_level: "$$$$", filename: "kuro-tarangire", amenities: ["隐秘设计", "极简奢华", "徒步游猎"], intro: "为了不破坏环境，整个营地设计得极其隐蔽，经常有野生动物穿过营地。" },
    { title: "Mpingo Ridge", english_title: "Lemala Mpingo Ridge", category: "山顶奢华", region: "Tarangire", location: "Tarangire Hills", price_level: "$$$$", filename: "mpingo-ridge", amenities: ["俯瞰整个公园", "户外浴缸", "日落景观"], intro: "位于高高的山脊之上，拥有塔兰吉雷国家公园最壮丽的全景视野。" },
    { title: "Lake Manyara Tree Lodge", english_title: "&Beyond Lake Manyara Tree Lodge", category: "顶级树屋", region: "Manyara", location: "Lake Manyara South", price_level: "$$$$$", filename: "lake-manyara-tree-lodge", amenities: ["全古木树屋", "森林深处", "户外淋浴"], intro: "这是曼雅拉湖国家公园内唯一的永久性奢华营地，让你完全沉浸在桃花心木森林的怀抱中。" },
    { title: "Escarpment Luxury Lodge", english_title: "Escarpment Luxury Lodge", category: "悬崖景观", region: "Manyara", location: "Lake Manyara Rim", price_level: "$$$", filename: "escarpment-lodge", amenities: ["悬崖边缘", "湖景露台", "无边泳池"], intro: "正如其名，酒店直直地矗立在大裂谷的悬崖边缘，脚下就是曼雅拉湖。" },

  # --- ZANZIBAR ---
  {
    title: "Park Hyatt Zanzibar",
    english_title: "Park Hyatt Zanzibar",
    category: "历史奢华 (Heritage Luxury)",
    region: "Zanzibar",
    location: "Stone Town",
    price_level: "$$$$ ($600+/night)",
    filename: "park-hyatt-zanzibar",
    amenities: ["海滨泳池", "联合国教科文组织建筑", "Anantara Spa", "市中心绝佳位置"],
    intro: "由两座被列入世界遗产的古建筑改造而成，直接坐落在石头城的海滩上。是探索石头城最完美的落脚点。"
  },
  {
    title: "Zuri Zanzibar",
    english_title: "Zuri Zanzibar",
    category: "设计型度假村 (Design Resort)",
    region: "Zanzibar",
    location: "Kendwa (North West)",
    price_level: "$$$$ ($700+/night)",
    filename: "zuri-zanzibar",
    amenities: ["私人海滩", "香料花园", "极简设计风格", "水上运动中心"],
    intro: "Zuri 在斯瓦希里语中意为'美丽'。这是一家颠覆传统的酒店，不设电视，鼓励你回归自然。拥有全岛唯一没有潮汐影响的私人沙滩。"
  },
  {
    title: "Baraza Resort",
    english_title: "Baraza Resort & Spa",
    category: "皇宫级奢华 (Palatial)",
    region: "Zanzibar",
    location: "Bwejuu (South East)",
    price_level: "$$$$$ ($1200+/night)",
    filename: "baraza-resort",
    amenities: ["全别墅房型", "苏丹皇宫风格", "私人小型泳池", "世界级 Spa"],
    intro: "被评为全球最好的 60 家新酒店之一。建筑风格模仿了阿曼苏丹的皇宫，极尽奢华与异域风情。"
  },
  {
    title: "White Sand Villas",
    english_title: "Zanzibar White Sand Luxury Villas",
    category: "精品别墅 (Boutique Villas)",
    region: "Zanzibar",
    location: "Paje",
    price_level: "$$$$$ ($1000+/night)",
    filename: "white-sand-villas",
    amenities: ["私人泳池别墅", "风筝冲浪中心", "屋顶香槟吧", "热带花园"],
    intro: "作为罗莱夏朵 (Relais & Châteaux) 的成员，这里提供极度私密的别墅体验。位于 Paje 海滩，是风筝冲浪爱好者的天堂。"
  },
    { title: "The Residence Zanzibar", english_title: "The Residence Zanzibar", category: "私密别墅", region: "Zanzibar", location: "Kizimkazi", price_level: "$$$$", filename: "the-residence-zanzibar", amenities: ["全私人泳池别墅", "巨大花园", "管家服务"], intro: "位于岛的最南端，被漫长的海岸线和茂密的花园包围，每栋别墅都配有巨大的私人泳池。" },
    { title: "Tulia Zanzibar", english_title: "Tulia Zanzibar Unique Beach Resort", category: "精品度假", region: "Zanzibar", location: "Pongwe", price_level: "$$$$", filename: "tulia-zanzibar", amenities: ["滑水道", "顶级服务奖", "精致餐饮"], intro: "曾获得'全球最佳浪漫海滩度假村'奖项。虽然规模不大，但服务极其细腻，还拥有岛上少有的滑水道。" },
    { title: "Xanadu Villas", english_title: "Xanadu Luxury Villas", category: "极致私密", region: "Zanzibar", location: "Dongwe", price_level: "$$$$$", filename: "xanadu-villas", amenities: ["私人主厨", "管家", "独特设计风格"], intro: "只有几栋极具个性的别墅，提供完全定制化的服务。在这里，你就是国王。" },
    { title: "Qambani Luxury Resort", english_title: "Qambani Luxury Resort", category: "海角秘境", region: "Zanzibar", location: "Michamvi", price_level: "$$$$", filename: "qambani-resort", amenities: ["无敌海景", "多个泳池", "宽阔空间"], intro: "占据了Michamvi半岛的一整个尖端，拥有广阔的空间和完美的日落视野。" },
    { title: "Emerson Spice", english_title: "Emerson Spice Hotel", category: "文化遗产", region: "Zanzibar", location: "Stone Town", price_level: "$$", filename: "emerson-spice", amenities: ["古宅改建", "屋顶餐厅", "波斯风格"], intro: "这不仅是酒店，更是一座活着的博物馆。它的屋顶餐厅是石头城看日落最浪漫的地方之一。" },
]

# 1. Generate Individual Hotel Files
hotels.each do |hotel|
  content = <<~HEREDOC
    ---
    layout: hotel
    title: #{hotel[:title]}
    english_title: #{hotel[:english_title]}
    category: #{hotel[:category]}
    location: #{hotel[:location]}
    price_level: "#{hotel[:price_level]}"
    amenities:
    #{hotel[:amenities].map { |a| "  - #{a}" }.join("\n")}
    ---

    ### 🏨 酒店介绍

    #{hotel[:intro]}

    ### 🌟 为什么选择这里？

    *   **地理位置**：位于 #{hotel[:location]}，拥有绝佳的地理优势。
    *   **独特体验**：体验#{hotel[:amenities][0]}以及#{hotel[:amenities][1]}。

    > 💡 **专家点评**：#{hotel[:title]} 是 #{hotel[:region]} 区域内备受赞誉的#{hotel[:category].split(' ').first}选择。它完美结合了舒适度与独特的坦桑尼亚风情。
  HEREDOC

  filepath = "hotels/#{hotel[:filename]}.md"
  File.write(filepath, content)
  puts "Generated #{filepath}"
end

# 2. Generate Hotels Index (hotels/index.md)
index_content = <<~HEREDOC
---
layout: default
title: 酒店精选数据库
---

# [ 模块: 酒店精选数据库 ]

这里收录了坦桑尼亚全境 **#{hotels.length}+** 家顶级住宿，涵盖了从野奢营地到海滨度假村的各类精选。

HEREDOC

# Group hotels by region
grouped = hotels.group_by { |h| h[:region] }

# Fixed order for regions
regions_order = ["Serengeti", "Ngorongoro", "Tarangire", "Manyara", "Arusha", "Zanzibar"]

regions_order.each do |region|
  next unless grouped[region]
  
  region_name_cn = case region
    when "Serengeti" then "塞伦盖蒂 (Serengeti)"
    when "Ngorongoro" then "恩戈罗恩戈罗 (Ngorongoro)"
    when "Tarangire" then "塔兰吉雷 (Tarangire)"
    when "Manyara" then "曼雅拉湖 (Lake Manyara)"
    when "Arusha" then "阿鲁沙 (Arusha)"
    when "Zanzibar" then "桑给巴尔岛 (Zanzibar)"
    else region
  end

  index_content += "\n## [ #{region_name_cn} ]\n\n"
  
  grouped[region].each do |hotel|
    index_content += "- [**#{hotel[:title]} (#{hotel[:english_title]})**]({{ site.baseurl }}/hotels/#{hotel[:filename]})\n"
    index_content += "  *   > #{hotel[:category].split(' ').first} | #{hotel[:intro].split('。').first}。\n"
  end
end

index_content += "\n---\n\n[.. (返回根目录)]({{ site.baseurl }}/)\n"

File.write("hotels/index.md", index_content)
puts "Generated hotels/index.md with #{hotels.length} hotels."
