# AGENTS.md - 开发者指南

Balbina Safari 是基于 Jekyll 的坦桑尼亚 Safari 旅游网站,支持中文/英文/法文多语言。

## 构建命令

```bash
# 安装依赖(仅首次)
bundle install

# 构建站点
bundle exec jekyll build

# 本地预览 (http://localhost:4000)
bundle exec jekyll serve

# 指定端口
bundle exec jekyll serve --port 4000

# 清理构建缓存
bundle exec jekyll clean

# 运行内容生成脚本
ruby _scripts/generate_packages.rb
ruby _scripts/generate_wildlife.rb
ruby _scripts/generate_blogs.rb
ruby _scripts/generate_hotels.rb
```

**无测试框架** - 需手动验证页面。

## 代码风格

### Ruby (_scripts/)
- 缩进: 2空格
- 注释: `#` 开头
- 数据结构: 数组+哈希,符号键
  ```ruby
  items = [{ key1: "value1", key2: "value2" }]
  ```
- 字符串: 双引号,插值 `"#{expression}"`
- 多行文本: `<<~HEREDOC` (去除缩进)
- 文件操作: `File.write(filepath, content)`

### Liquid/Jekyll 模板
- 输出: `{{ variable }}`
- 逻辑: `{% if %}`, `{% for item in items %}`, `{% assign var = value %}`
- 包含: `{% include filename.html %}`
- 注释: `{% comment %} text {% endcomment %}`
- 国际化: `{{ t.nav.home }}` (定义在 _data/locales.yml)
- SEO标签: `{% seo %}`

### Markdown Frontmatter
- 使用 `---` 包裹 YAML
- 语言键: `title`, `title_cn`, `title_en`, `english_title`
- 布尔值: `published: true`
- 数组: `highlights:`, `tags:`, `destinations:`

### CSS (assets/css/style.css)
- 主题: GitHub Dark 风格,终端/等宽字体美学
- 字体: `"SFMono-Regular", Consolas, monospace`
- 字号: 13px
- 命名: BEM风格 (`.search-modal`, `.result-title`)
- 响应式: `@media (max-width: 768px)`
- 颜色: 背景#0d1117, 文本#b4bdba, 链接#46b57d

### JavaScript (assets/js/)
- 风格: Vanilla ES5+,无框架
- 函数: camelCase (`performSearch`, `showSearchResults`)
- 常量: UPPER_SNAKE_CASE
- DOM操作: `document.createElement`, `appendChild`
- 事件: `addEventListener('DOMContentLoaded', ...)`

## 命名规范

| 类型 | 规范 | 示例 |
|------|------|------|
| 文件 | kebab-case | `package-name.md` |
| Ruby变量 | snake_case | `page_title` |
| Liquid变量 | snake_case | `current_lang` |
| JavaScript | camelCase | `searchInput` |
| CSS类 | kebab-case | `.search-modal` |
| YAML键 | snake_case | `english_title` |

## 国际化

- 默认语言: `zh` (无URL前缀)
- 支持: `zh`, `en`, `fr`
- URL结构: `/`, `/en/`, `/fr/`
- 本地化数据: `_data/locales.yml`

## 错误处理

- Ruby: `begin/rescue` 包裹外部操作
- Liquid: 使用 `{% if variable %}` 检查后再输出
- JavaScript: 使用 `if (element && element.value)` 检查空值

## 常用模式

```liquid
{# 内部链接 #}
{{ site.baseurl }}/path/

{# 跨引用 #}
[文本]({{ site.baseurl }}/collection/slug)
```

- 搜索数据: 需同步更新 Ruby生成器 和 `assets/js/search.js`
- 布局继承: 内容页面使用 `layout: collection_name`
- 语言前缀: 使用 `{{ prefix }}` 构建语言感知链接

## 添加内容流程

1. 在 `_scripts/` 对应生成器中添加条目
2. 运行: `ruby _scripts/generate_xxx.rb`
3. 如需搜索支持,更新 `assets/js/search.js`
4. 添加本地化版本到 `en/` 或 `fr/` 目录
5. 本地测试: `bundle exec jekyll serve`

## 集合 Frontmatter 键

**Packages**: title, english_title, duration, category, difficulty, best_time, group_size, destinations[], price_from, price_level, highlights[], target_audience[]

**Wildlife**: title_cn, title_en, scientific_name, category, conservation_status, weight, length, lifespan, habitat, key_features[], best_spots[]

**Hotels**: title, english_title, category, location, price_level, amenities[]

**Destinations**: location, best_season, recommended_days, entry_fee, key_highlights[], seasonal_info

**Blogs**: title, author, date, trip_type, related_package, tags[]

## 项目结构

```
├── _config.yml          # Jekyll配置
├── Gemfile              # Ruby依赖
├── _layouts/            # HTML模板(Liquid)
├── _includes/           # 可复用组件
├── _sass/               # SCSS源文件
├── _scripts/            # Ruby内容生成器
├── _data/               # YAML数据(locales.yml, common.yml)
├── assets/              # 静态资源(css, js, images)
├── packages/            # 24个套餐页面
├── wildlife/            # 20+野生动物页面
├── destinations/       # 15个目的地页面
├── hotels/              # 51个酒店页面
├── blogs/               # 30篇游记
├── services/           # 5个服务页面
├── transportations/    # 5个交通页面
├── en/                  # 英文本地化
└── fr/                  # 法文本地化
```

## 联系方式

- Email: info@balbinasafari.com
- WeChat: baba-leo
- WhatsApp: +255653486509
