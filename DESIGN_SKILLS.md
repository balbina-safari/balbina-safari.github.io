# DESIGN_SKILLS.md - 前端设计技能指南

本文档定义了 Balbina Safari 网站的设计系统、视觉规范和前端美术技能。

---

## 🎨 色彩系统

### 主色调（GitHub Dark 灵感）

```css
/* 背景色系 */
--bg-primary: #0d1117      /* 深色背景 */
--bg-secondary: #161b22    /* 次级背景（卡片） */
--bg-card: #161b22         /* 卡片背景 */

/* 文字色系 */
--text-primary: #b4bdba    /* 主要文字 - 灰白色 */
--text-secondary: #8b949e  /* 次要文字 - 更深的灰 */
--text-strong: #ededea     /* 强调文字 - 近白色 */
--text-dim: #596671        /* 暗淡文字 - 引用 */

/* 标题渐变色系（从强到弱） */
--h1-primary: #f57e38      /* 鲜艳红/橙色 - 最重要 */
--h2-primary: #e0c40b      /* 明亮黄色 */
--h3-primary: #82e333      /* 鲜艳绿色 */
--h4-primary: #ffa657      /* 橙色 */

/* 交互色彩 */
--link-primary: #46b57d    /* 绿色链接 */
--link-hover: #59e8b3      /* 悬停浅绿 */
--link-hover-bg: #59e8b3   /* 悬停背景 */

/* 功能色彩 */
--border-primary: #30363d  /* 边框颜色 */
--code-primary: #ffa657    /* 代码橙色 */
--success: #238636         /* 成功绿色（徽章） */
--highlight: #58a6ff       /* 高亮蓝色 */
--rating: #e3b341          /* 评分星级 */
```

### 色彩使用原则

1. **标题层级**：H1 > H2 > H3 > H4，颜色饱和度递减
2. **链接状态**：默认绿色 + 悬停高亮
3. **暗色模式优先**：所有设计基于深色背景
4. **高对比度**：确保文字与背景对比度 ≥ 4.5:1

---

## ✏️ 排版系统

### 字体栈

```css
font-family: "SFMono-Regular", Consolas, "Liberation Mono", Menlo, monospace;
```

**设计理念**：
- 等宽字体（Monospace）
- 终端风格美学
- 技术感 + 专业感

### 字体大小

```css
/* 全局统一 */
--font-base: 13px
--font-line-height: 1.4

/* 特殊元素 */
--font-small: 12px      /* 次要信息 */
--font-rating: 16px     /* 评分星级 */
```

**原则**：所有文字元素统一 13px，通过颜色和粗细区分层级

### 字体粗细

```css
H1: 900   /* 最粗 - 页面主标题 */
H2: 800   /* 次粗 - 章节标题 */
H3: 700   /* 中等 - 小节标题 */
H4: 600   /* 普通 - 四级标题 */
Strong: 600 /* 强调文字 */
```

### 文本转换

```css
H1: text-transform: uppercase;  /* 大写 */
H3::before: content: "> ";     /* 终端风格前缀 */
```

---

## 🎭 组件设计

### 卡片组件

```css
.testimonial-card {
  background-color: #161b22;
  border: 1px solid #30363d;
  border-radius: 6px;
  padding: 20px;
  transition: transform 0.2s ease;
}

.testimonial-card:hover {
  transform: translateY(-5px);
  border-color: #58a6ff;
}
```

**交互效果**：
- 悬停上移 5px
- 边框变蓝高亮
- 平滑过渡 0.2s

### 徽章组件

```css
.badge-item {
  background-color: #238636;
  color: #fff;
  padding: 12px;
  border-radius: 6px;
  font-weight: bold;
}
```

**用途**：信任徽章、状态标签

### 引用块

```css
blockquote {
  border-left: 3px solid #596671;
  padding-left: 15px;
  color: #8b949e;
  font-style: italic;
}
```

**视觉特征**：左侧彩色边框 + 斜体

---

## 🖱️ 交互设计

### 链接状态

```css
/* 默认状态 */
a {
  color: #46b57d;
  text-decoration: underline;
}

/* 悬停状态 */
a:hover {
  background-color: #59e8b3;
  color: #000000;
  text-decoration: none;
}
```

**交互模式**：
- 颜色反转（绿 → 黑）
- 背景高亮
- 下划线消失

### 动画效果

```css
/* 光标闪烁动画 */
@keyframes blink {
  from, to { opacity: 1; }
  50% { opacity: 0; }
}

body::after {
  content: "_";
  animation: blink 1s step-end infinite;
}
```

**终端光标**：页面末尾闪烁的下划线

### 过渡效果

```css
transition: transform 0.2s ease;
```

**原则**：快速、平滑、自然

---

## 📐 布局系统

### 容器

```css
body {
  max-width: 900px;
  margin: 0 auto;
  line-height: 1.4;
}
```

**布局原则**：
- 最大宽度 900px（阅读舒适区）
- 居中对齐
- 行高 1.4（可读性）

### Grid 系统

```css
/* 自适应网格 */
grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
gap: 20px;
```

**响应式**：自动适应屏幕宽度

### 间距系统

```css
/* 统一间距 */
margin-bottom: 1em;        /* 垂直间距 */
gap: 20px;                /* Grid 间距 */
padding-left: 15px;       /* 内边距 */
border-left: 3px;          /* 边框宽度 */
```

**原则**：使用 em 单位，保持相对比例

---

## 📱 响应式设计

### 断点

```css
@media (max-width: 768px) {
  /* 移动端适配 */
  .testimonials-section {
    grid-template-columns: 1fr;
  }

  .trust-badges {
    grid-template-columns: 1fr 1fr;
  }
}
```

**策略**：
- 768px 以下：单列布局
- 768px 以上：多列网格
- Grid 自动适配（auto-fit）

---

## 🏷️ 命名规范

### CSS 类名

**BEM 风格**：
```css
.block { }
.block__element { }
.block--modifier { }
```

**示例**：
```css
.testimonial-card { }
.testimonial-card__author { }
.testimonial-card--featured { }
```

### 变量命名

**CSS 自定义属性**：
```css
--color-primary
--font-base
--spacing-md
```

**JavaScript 变量**：
```css
camelCase (searchInput, showResults)
UPPER_SNAKE_CASE (SEARCH_DATA)
```

---

## 🎯 设计原则

### 1. 统一性
- 所有元素 13px
- 统一字体栈
- 一致的间距系统

### 2. 层级清晰
- 通过颜色区分（H1 红 → H4 橙）
- 通过粗细区分（900 → 600）
- 通过位置区分（margin-bottom）

### 3. 交互明确
- 悬停高亮
- 光标闪烁
- 平滑过渡

### 4. 性能优先
- 最小化 DOM 操作
- 使用 CSS 动画（非 JS）
- 避免过度设计

### 5. 无障碍
- 高对比度
- 语义化 HTML
- ARIA 标签

---

## 🛠️ 常用代码片段

### 卡片悬停效果
```css
.card {
  transition: transform 0.2s ease, border-color 0.2s ease;
}
.card:hover {
  transform: translateY(-5px);
  border-color: #58a6ff;
}
```

### 链接高亮
```css
a {
  color: #46b57d;
  text-decoration: underline;
  transition: all 0.15s ease;
}
a:hover {
  background-color: #59e8b3;
  color: #000000;
  text-decoration: none;
}
```

### 响应式网格
```css
.grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 20px;
}
@media (max-width: 768px) {
  .grid {
    grid-template-columns: 1fr;
  }
}
```

---

## 📊 设计检查清单

添加新组件时，确保：

- [ ] 使用正确的色彩变量
- [ ] 保持 13px 字体大小
- [ ] 添加悬停状态
- [ ] 考虑响应式
- [ ] 遵循 BEM 命名
- [ ] 添加平滑过渡
- [ ] 测试对比度
- [ ] 包含 ARIA 标签

---

## 🚀 最佳实践

1. **优先使用 CSS 变量**：`var(--color-primary)` 而非硬编码
2. **避免魔法数字**：使用 `1em` 而非 `16px`
3. **保持简洁**：不要过度装饰
4. **渐进增强**：基础样式 → 悬停效果 → 动画
5. **测试真实设备**：不仅仅是浏览器模拟器

---

*此文档与 AGENTS.md 配合使用，AGENTS.md 负责代码规范，DESIGN_SKILLS.md 负责视觉设计规范。*
