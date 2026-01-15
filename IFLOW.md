# Balbina Safari 项目文档

## 项目概述

这是一个基于 Jekyll 的静态网站项目,用于展示巴比旅行(Balbina Safari)的坦桑尼亚 Safari 旅游服务。项目采用 GitHub Pages 托管,提供中文和英文双语内容,专注于坦桑尼亚野生动物游猎、登山和海岛度假业务。

### 核心功能

- **套餐展示**: 22 个精选旅游套餐,涵盖经济型到奢华级
- **目的地介绍**: 14 个坦桑尼亚旅游目的地详细信息
- **酒店推荐**: 45+ 精选酒店和营地
- **野生动物图鉴**: 100+ 种野生动物详细介绍
- **真实游记**: 30+ 篇客户旅行故事和经验分享
- **服务项目**: 特色服务(热气球、中文翻译等)
- **交通方式**: Safari 车辆、自驾露营、机场接送等

### 技术栈

- **静态站点生成器**: Jekyll 3.9.5
- **样式**: 自定义 CSS (GitHub Dark 风格)
- **Markdown**: Kramdown (GFM 解析器)
- **SEO**: jekyll-seo-tag 插件
- **托管**: GitHub Pages

## 项目结构

```
balbina-safari.github.io.git/
├── _config.yml          # Jekyll 配置文件
├── Gemfile              # Ruby 依赖管理
├── index.md             # 首页
├── _layouts/            # 布局模板
│   ├── default.html     # 默认布局
│   ├── blog.html        # 博客文章布局
│   ├── destination.html # 目的地页面布局
│   ├── hotel.html       # 酒店页面布局
│   ├── package.html     # 套餐页面布局
│   └── wildlife.html    # 野生动物页面布局
├── _scripts/            # 生成脚本
│   ├── generate_blogs.rb    # 生成博客文章框架
│   ├── generate_hotels.rb   # 生成酒店页面
│   ├── generate_packages.rb # 生成套餐页面
│   └── generate_wildlife.rb # 生成野生动物页面
├── assets/              # 静态资源
│   ├── css/
│   │   └── style.css    # 主样式文件
│   └── images/          # 图片资源
├── blogs/               # 游记文章 (30+ 篇)
├── destinations/        # 目的地页面 (14 个)
├── hotels/              # 酒店页面 (45+ 个)
├── packages/            # 套餐页面 (22 个)
├── services/            # 服务页面
├── transportations/     # 交通页面
└── wildlife/            # 野生动物页面 (20+ 种)
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

- 主样式文件: `assets/css/style.css`
- 设计风格: GitHub Dark 主题,终端风格
- 字体: 等宽字体 (SFMono-Regular, Consolas, Liberation Mono, Menlo)
- 基础字号: 13px
- 配色方案:
  - 背景: `#0d1117` (深色背景)
  - 文本: `#c9d1d9` (灰白色)
  - 链接: `#58a6ff` (蓝色)
  - 标题 H1: `#ff7b72` (红色/鲑鱼色)
  - 标题 H2: `#79c0ff` (亮蓝色)
  - 标题 H3: `#d2a8ff` (紫色)
  - 标题 H4: `#ffa657` (橙色)

### 图片资源

图片文件应放置在 `assets/images/` 目录中。引用图片时使用:

```markdown
![图片描述]({{ site.baseurl }}/assets/images/image-name.jpg)
```

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

### 目的地 (Destinations)

分为四大区域:
- 北部环线: 塞伦盖蒂、恩戈罗恩戈罗、塔兰吉雷等
- 南部环线: 鲁阿哈、尼雷尔
- 西部秘境: 马哈勒、卡塔维
- 海岛度假: 桑给巴尔、马菲亚岛

### 野生动物 (Wildlife)

包含 Big 5 和其他特色动物:
- Big 5: 狮子、豹子、大象、犀牛、水牛
- 其他: 长颈鹿、斑马、角马、猎豹、黑猩猩等

### 酒店 (Hotels)

按档次分类:
- 奢华营地: Singita、Four Seasons 等
- 中档精选: Elewana、Sopa 等
- 经济实惠: 公共营地、Budget Lodge

## SEO 配置

使用 `jekyll-seo-tag` 插件优化 SEO:

```yaml
title: Balbina Safari
description: Your gateway to unforgettable African safari adventures.
url: "https://balbina-safari.github.io"
```

## 自定义域名

当前使用 GitHub Pages 默认域名。如需使用自定义域名,需:

1. 在 `_config.yml` 中设置 `url` 和 `baseurl`
2. 在仓库设置中配置自定义域名
3. 在域名 DNS 设置中添加 CNAME 记录指向 GitHub Pages

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

编辑 `assets/css/style.css` 文件。样式采用 GitHub Dark 风格,保持一致性。

### 更新配置

修改 `_config.yml` 文件后需要重启 Jekyll 服务器:

```bash
# 停止当前服务器 (Ctrl+C)
bundle exec jekyll serve
```

## 注意事项

1. **Front Matter**: 所有 Markdown 文件必须包含 Front Matter,否则 Jekyll 不会处理
2. **图片路径**: 使用 `{{ site.baseurl }}` 确保在所有环境下都能正确引用
3. **文件命名**: 使用小写字母和连字符,避免空格和特殊字符
4. **Git 提交**: 避免提交 `_site/` 目录和 Gemfile.lock
5. **中文内容**: 项目主要面向中文用户,内容以中文为主

## 联系信息

- 邮箱: info@balbinasafari.com
- 微信: BalbinaSafari
- 营业时间: 北京时间 14:00-22:00