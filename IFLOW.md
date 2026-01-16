# Balbina Safari 项目文档

## 项目概述

这是一个基于 Jekyll 的静态网站项目,用于展示巴比旅行(Balbina Safari)的坦桑尼亚 Safari 旅游服务。项目采用 GitHub Pages 托管,提供中文和英文双语内容,专注于坦桑尼亚野生动物游猎、登山和海岛度假业务。

### 核心功能

- **套餐展示**: 24 个精选旅游套餐,涵盖经济型到奢华级
- **目的地介绍**: 15 个坦桑尼亚旅游目的地详细信息
- **酒店推荐**: 51 个精选酒店和营地
- **野生动物图鉴**: 20+ 种野生动物详细介绍
- **真实游记**: 30 篇客户旅行故事和经验分享
- **服务项目**: 特色服务(热气球、中文翻译等)
- **交通方式**: Safari 车辆、自驾露营、机场接送等
- **套餐对比**: 支持最多对比 3 个套餐的功能
- **全局搜索**: 搜索套餐、目的地、野生动物、酒店、游记
- **联系表单**: 完整的在线咨询表单

### 技术栈

- **静态站点生成器**: Jekyll 3.9.5
- **样式**: 自定义 CSS (GitHub Dark 风格,使用 SCSS 变量)
- **Markdown**: Kramdown (GFM 解析器)
- **SEO**: jekyll-seo-tag 插件
- **站点地图**: jekyll-sitemap 插件
- **前端交互**: 原生 JavaScript (无框架)
- **托管**: GitHub Pages

## 项目结构

```
balbina-safari.github.io.git/
├── _config.yml          # Jekyll 配置文件
├── Gemfile              # Ruby 依赖管理
├── index.md             # 首页
├── about.md             # 关于我们
├── contact.md           # 联系我们
├── _layouts/            # 布局模板
│   ├── default.html     # 默认布局
│   ├── blog.html        # 博客文章布局
│   ├── destination.html # 目的地页面布局
│   ├── hotel.html       # 酒店页面布局
│   ├── package.html     # 套餐页面布局
│   └── wildlife.html    # 野生动物页面布局
├── _includes/           # 可复用组件
│   ├── navigation.html  # 导航栏(含搜索框)
│   ├── breadcrumbs.html # 面包屑导航
│   ├── footer.html      # 页脚
│   └── packages/        # 套餐页面专用组件
│       ├── action_buttons.html     # 操作按钮
│       ├── blogs_box.html          # 相关博客
│       ├── destinations_box.html   # 包含目的地
│       ├── highlights_box.html     # 亮点
│       ├── price_box.html          # 价格信息
│       ├── sidebar.html            # 侧边栏
│       ├── target_audience_box.html # 适合人群
│       └── wildlife_box.html       # 包含动物
├── _sass/               # SCSS 样式文件
│   ├── _variables.scss  # SCSS 变量
│   ├── _base.scss       # 基础样式
│   └── _components.scss # 组件样式
├── _scripts/            # 生成脚本
│   ├── generate_blogs.rb    # 生成博客文章框架
│   ├── generate_hotels.rb   # 生成酒店页面
│   ├── generate_packages.rb # 生成套餐页面
│   └── generate_wildlife.rb # 生成野生动物页面
├── _data/               # 数据文件
│   ├── common.yml       # 通用数据(公司信息、概率标签等)
│   └── locales.yml      # 国际化文本(中英文)
├── assets/              # 静态资源
│   ├── css/
│   │   └── style.css    # 主样式文件(从 SCSS 编译)
│   ├── images/          # 图片资源
│   └── js/
│       ├── search.js    # 全局搜索功能
│       └── compare.js   # 套餐对比功能
├── blogs/               # 游记文章 (30 篇)
├── destinations/        # 目的地页面 (15 个)
├── hotels/              # 酒店页面 (51 个)
├── packages/            # 套餐页面 (24 个)
├── services/            # 服务页面
├── transportations/     # 交通页面
├── wildlife/            # 野生动物页面 (20+ 种)
└── en/                  # 英文版本
    ├── about.md
    ├── contact.md
    ├── index.md
    ├── about/
    ├── blogs/
    ├── contact/
    ├── destinations/
    ├── hotels/
    ├── packages/
    └── wildlife/
```

## 构建和运行

### 环境要求

- Ruby 2.5 或更高版本
- Bundler

### 安装依赖

```bash
bundle install
```

### 本地开发服务器

```bash
bundle exec jekyll serve
```

默认访问地址: `http://localhost:4000`

### 构建生产版本

```bash
bundle exec jekyll build
```

构建后的静态文件将生成在 `_site/` 目录中。

### 部署到 GitHub Pages

项目已配置为通过 GitHub Pages 自动部署。推送到 `main` 分支后,GitHub Pages 会自动构建并发布网站。

## 开发约定

### 内容文件规范

所有内容文件使用 Markdown 格式,必须包含 Front Matter:

```yaml
---
layout: [layout-name]
title: [页面标题]
[其他自定义字段]
---
```

### 页面类型

1. **首页** (`index.md`): 使用 `default` 布局
2. **博客文章** (`blogs/*.md`): 使用 `blog` 布局
3. **套餐页面** (`packages/*.md`): 使用 `package` 布局
4. **目的地页面** (`destinations/*.md`): 使用 `destination` 布局
5. **酒店页面** (`hotels/*.md`): 使用 `hotel` 布局
6. **野生动物页面** (`wildlife/*.md`): 使用 `wildlife` 布局
7. **关于我们** (`about.md`): 使用 `default` 布局
8. **联系我们** (`contact.md`): 使用 `default` 布局

### 内容生成脚本

项目包含 Ruby 脚本用于批量生成内容框架:

- `generate_blogs.rb`: 生成博客文章框架,包含 29 个预设博客模板
- `generate_hotels.rb`: 生成酒店页面框架
- `generate_packages.rb`: 生成套餐页面框架
- `generate_wildlife.rb`: 生成野生动物页面框架

运行生成脚本:

```bash
ruby _scripts/generate_blogs.rb
ruby _scripts/generate_hotels.rb
ruby _scripts/generate_packages.rb
ruby _scripts/generate_wildlife.rb
```

### 样式规范

- **主样式文件**: `assets/css/style.css`
- **SCSS 组织**: 使用 `_sass/` 目录组织样式
  - `_variables.scss`: 定义颜色、字体等变量
  - `_base.scss`: 基础样式和重置
  - `_components.scss`: 组件样式
- **设计风格**: GitHub Dark 主题,终端风格
- **字体**: 等宽字体 (SFMono-Regular, Consolas, Liberation Mono, Menlo)
- **基础字号**: 13px
- **配色方案**:
  - 背景: `#0d1117` (深色背景)
  - 文本: `#b4bdba` (灰白色)
  - 链接: `#46b57d` (绿色)
  - 链接悬停背景: `#59e8b3`
  - 高亮: `#ffa657` (橙色)
  - 边框: `#30363d`
  - 卡片背景: `#161b22`
  - 标题 H1: `#f57e38` (橙红色)
  - 标题 H2: `#e0c40b` (黄色)
  - 标题 H3: `#82e333` (绿色)

### 图片资源

图片文件应放置在 `assets/images/` 目录中。引用图片时使用:

```markdown
![图片描述]({{ site.baseurl }}/assets/images/image-name.jpg)
```

### JavaScript 功能

项目包含以下 JavaScript 功能:

- **全局搜索** (`assets/js/search.js`): 支持搜索套餐、目的地、野生动物、酒店、游记
- **套餐对比** (`assets/js/compare.js`): 支持最多对比 3 个套餐

### 国际化支持

项目支持中英文双语:

- **数据文件**: `_data/locales.yml` 包含中英文界面文本
- **英文目录**: `en/` 目录包含英文版本页面
- **语言配置**: `_config.yml` 中配置了 `languages: ["zh", "en"]` 和 `default_lang: "zh"`

### Git 忽略规则

项目使用 `.gitignore` 忽略以下内容:

- Jekyll 生成目录: `_site/`, `.sass-cache/`, `.jekyll-cache/`
- Ruby 依赖: `vendor/`, `.bundle/`, `Gemfile.lock`
- 系统文件: `.DS_Store`
- 日志文件: `*.log`

## 内容组织

### 套餐 (Packages)

套餐按类型分类:
- 经济型: 3-4 天,预算友好
- 经典型: 5-7 天,首次 Safari 首选
- 奢华型: 7-10 天,顶级营地体验
- 主题型: 摄影、观鸟、文化、家庭等
- 挑战型: 登山、极限运动

套餐页面包含以下信息:
- 价格信息
- 适合人群标签
- 包含目的地
- 包含野生动物
- 亮点
- 相关博客
- 操作按钮(立即咨询、加入对比)

### 目的地 (Destinations)

分为四大区域:
- 北部环线: 塞伦盖蒂、恩戈罗恩戈罗、塔兰吉雷等
- 南部环线: 鲁阿哈、尼雷尔
- 西部秘境: 马哈勒、卡塔维
- 海岛度假: 桑给巴尔、马菲亚岛

目的地页面包含季节性信息组件,显示不同季节的动物情况和最佳游览时间。

### 野生动物 (Wildlife)

包含 Big 5 和其他特色动物:
- Big 5: 狮子、豹子、大象、犀牛、水牛
- 其他: 长颈鹿、斑马、角马、猎豹、黑猩猩等

野生动物页面包含:
- 目击概率标签(极高、高、中、低)
- 保护状态标签
- 详细的生活习性描述

### 酒店 (Hotels)

按档次分类:
- 奢华营地: Singita、Four Seasons 等
- 中档精选: Elewana、Sopa 等
- 经济实惠: 公共营地、Budget Lodge

### 博客 (Blogs)

包含 30 篇游记文章,涵盖:
- 客户真实旅行故事
- 野生动物观察指南
- 摄影技巧分享
- 目的地深度介绍
- 套餐推荐

## SEO 配置

使用 `jekyll-seo-tag` 插件优化 SEO:

```yaml
title: 巴比旅行 - 坦桑尼亚Safari专家
description: 坦桑尼亚专业地接旅行社,提供塞伦盖蒂、恩戈罗恩戈罗、乞力马扎罗等经典Safari套餐,中文服务,安全可靠。
url: "https://balbina-safari.github.io"
lang: zh-CN
author: Balbina Safari
```

已配置:
- Open Graph 标签(Facebook)
- Twitter Card 标签
- Canonical URL
- Favicon 链接
- 社交媒体链接

### 站点地图

使用 `jekyll-sitemap` 插件自动生成 `sitemap.xml`,便于搜索引擎收录。

## 自定义域名

当前使用 GitHub Pages 默认域名。如需使用自定义域名,需:

1. 在 `_config.yml` 中设置 `url` 和 `baseurl`
2. 在仓库设置中配置自定义域名
3. 在域名 DNS 设置中添加 CNAME 记录指向 GitHub Pages

## 组件系统

### 导航栏组件 (`navigation.html`)

- 响应式设计,移动端汉堡菜单
- 集成搜索框
- 中英文导航链接

### 面包屑导航组件 (`breadcrumbs.html`)

- 自动根据页面类型生成导航路径
- 支持套餐、目的地、酒店、野生动物、博客页面

### 页脚组件 (`footer.html`)

- 快速链接
- 联系方式(邮箱、微信、WhatsApp)
- 营业时间

### 套餐页面组件

位于 `_includes/packages/` 目录:
- `action_buttons.html`: 立即咨询和加入对比按钮
- `blogs_box.html`: 相关博客推荐
- `destinations_box.html`: 包含的目的地
- `highlights_box.html`: 套餐亮点
- `price_box.html`: 价格信息
- `sidebar.html`: 侧边栏信息
- `target_audience_box.html`: 适合人群标签
- `wildlife_box.html`: 包含的野生动物

## 常见任务

### 添加新套餐

1. 创建新文件 `packages/new-package.md`
2. 添加 Front Matter 和内容
3. 更新 `packages/index.md` 列表
4. 可选: 运行 `ruby _scripts/generate_packages.rb` 生成框架

### 添加新博客

1. 创建新文件 `blogs/new-blog.md`
2. 使用 `blog` 布局
3. 添加必要的 Front Matter (author, date, trip_type, tags)
4. 更新 `blogs/index.md` 列表

### 修改样式

编辑 SCSS 文件:
- 修改颜色变量: `_sass/_variables.scss`
- 修改基础样式: `_sass/_base.scss`
- 修改组件样式: `_sass/_components.scss`

修改后需要重新编译 CSS,或者直接编辑 `assets/css/style.css`。

### 添加新的国际化文本

编辑 `_data/locales.yml` 文件,添加中英文对应的文本。

### 更新配置

修改 `_config.yml` 文件后需要重启 Jekyll 服务器:

```bash
# 停止当前服务器 (Ctrl+C)
bundle exec jekyll serve
```

## 优化记录

项目已进行多轮优化,详见 `OPTIMIZATION_SUMMARY.md`:

### 已完成的优化

1. 首页优化(快速筛选、客户评价、信任徽章)
2. 联系表单功能
3. 套餐页面优化(适合人群标签、对比功能)
4. 布局模板优化(导航栏、面包屑、页脚)
5. 全局搜索功能
6. 目的地页面优化(季节性信息)
7. SEO 优化(meta 标签、sitemap)
8. Big 5 动物内容(狮子、大象已完成)
9. 套餐对比功能
10. JavaScript 功能集成
11. 国际化支持(中英文)

### 待完成的优化

- 完成 Big 5 剩余 3 个动物(豹子、犀牛、水牛)的详细内容
- 添加图片资源
- 优化移动端体验
- 完善英文版本内容
- 添加收藏功能
- 性能优化(CSS/JS 压缩、图片优化、懒加载)

## 注意事项

1. **Front Matter**: 所有 Markdown 文件必须包含 Front Matter,否则 Jekyll 不会处理
2. **图片路径**: 使用 `{{ site.baseurl }}` 确保在所有环境下都能正确引用
3. **文件命名**: 使用小写字母和连字符,避免空格和特殊字符
4. **Git 提交**: 避免提交 `_site/` 目录和 Gemfile.lock
5. **中文内容**: 项目主要面向中文用户,内容以中文为主
6. **JavaScript**: 使用原生 JavaScript,避免引入大型框架
7. **样式**: 优先使用 SCSS 变量,保持样式一致性
8. **国际化**: 添加新文本时记得同时更新 `_data/locales.yml`

## 联系信息

- 邮箱: info@balbinasafari.com
- 微信: baba-leo
- WhatsApp: +255653486509
- 营业时间: 北京时间 14:00-22:00