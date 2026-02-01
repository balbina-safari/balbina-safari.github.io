# AGENTS.md - Developer Guidelines

This is a Jekyll static site generator project for Balbina Safari (Tanzania travel agency).

## Build/Test Commands

```bash
# Build site
bundle exec jekyll build

# Serve locally with live reload
bundle exec jekyll serve

# Serve with specific host and port
bundle exec jekyll serve --host 0.0.0.0 --port 4000

# Clean build output
bundle exec jekyll clean

# Run content generation scripts (from root)
ruby _scripts/generate_packages.rb
ruby _scripts/generate_wildlife.rb
ruby _scripts/generate_blogs.rb
ruby _scripts/generate_hotels.rb
```

**No test framework configured** - Manual testing required by serving locally and verifying pages.

## Project Structure

- `_layouts/` - HTML templates (Liquid)
- `_includes/` - Reusable partials (navigation, footer, breadcrumbs)
- `_data/` - YAML data files (locales.yml for i18n, common.yml)
- `_scripts/` - Ruby generators for content
- `packages/`, `wildlife/`, `destinations/`, `hotels/`, `blogs/` - Content collections
- `assets/css/`, `assets/js/` - Stylesheets and scripts
- `en/`, `fr/` - Localized content (default: `zh` root)

## Code Style

### Ruby (_scripts/)
- **Indentation**: 2 spaces
- **Comments**: `#` at line start
- **Data structures**: Arrays of hashes with symbol keys
  ```ruby
  items = [
    { key1: "value1", key2: "value2" }
  ]
  ```
- **String literals**: Double quotes preferred
- **Interpolation**: `"Text #{expression}"`
- **Heredocs**: Use `<<~HEREDOC` for multi-line (strips leading whitespace)
- **Iteration**: `.each { |item| ... }`
- **Array transformations**: `.map { |x| ... }.join("\n")`
- **File operations**: `File.write(filepath, content)`
- **Pattern**: Hash objects passed to HEREDOC templates with `#{item[:key]}`

### Liquid/Jekyll Templates
- **Output**: `{% raw %}{{ variable }}{% endraw %}`
- **Logic**: `{% raw %}{% if %}{% endraw %}`, `{% raw %}{% for item in items %}{% endraw %}`, `{% raw %}{% assign var = value %}{% endraw %}`
- **Includes**: `{% raw %}{% include filename.html %}{% endraw %}`
- **Comments**: `{% raw %}{% comment %}{% endraw %} text {% raw %}{% endcomment %}{% endraw %}`
- **Filters**: `| split:`, `| replace:`, `| append:`, `| strip_html`
- **i18n**: Use `strings.nav.item` or `t.site.title` (defined in _data/locales.yml)
- **Language detection**: Handled by `_includes/lang_init.html` (sets `current_lang`, `prefix`, `t`)

### Markdown Frontmatter
- YAML format enclosed in `---`
- Language keys: `title`, `title_cn`, `title_en`, `english_title`
- Use lists: `keywords: [item1, item2]` or `keywords:\n  - item1`
- Boolean: `published: true`
- Arrays for lists: `amenities:`, `highlights:`, `tags:`

### CSS (assets/css/style.css)
- **Theme**: GitHub Dark-inspired, terminal/monospace aesthetic
- **Font**: `"SFMono-Regular", Consolas, "Liberation Mono", Menlo, monospace`
- **Colors**:
  - Background: `#0d1117`
  - Text: `#b4bdba`
  - H1: `#f57e38` (vibrant red/salmon)
  - H2: `#e0c40b` (yellow)
  - H3: `#82e333` (green) with `> ` prefix
  - H4: `#ffa657` (orange)
  - Links: `#46b57d` with hover `#59e8b3`
  - Code: `#ffa657`
- **Base font size**: 13px
- **Pattern**: BEM-like naming (`.testimonial-card`, `.search-modal`)
- **Responsive**: `@media (max-width: 768px)`

### JavaScript (assets/js/)
- **Style**: Vanilla ES5+, no frameworks
- **Event listeners**: `document.addEventListener('DOMContentLoaded', ...)`
- **Functions**: camelCase names
- **Constants**: Upper snake case (`const SEARCH_DATA = ...`)
- **CSS injection**: `document.createElement('style')`, `style.textContent = ...`
- **Modals**: Create/append to DOM, remove on close
- **Comments**: `//` single line, `/* */` multi-line

### Naming Conventions
- **Files**: kebab-case (`package-name.md`, `filename.html`)
- **Ruby variables**: snake_case (`page_title`, `file_path`)
- **Liquid variables**: snake_case (`current_lang`, `page.title`)
- **JavaScript**: camelCase (`searchInput`, `showResults`)
- **CSS classes**: kebab-case (`.search-modal`, `.result-title`)
- **YAML keys**: snake_case (`english_title`, `best_time`)

### Internationalization
- **Default language**: `zh` (no URL prefix)
- **Supported**: `zh`, `en`, `fr`
- **URL structure**: `/` (default), `/en/`, `/fr/`
- **Locale data**: `_data/locales.yml` with structure:
  ```yaml
  zh:
    nav:
      home: "首页"
    ui:
      contact_now: "立即咨询"
  ```
- **Access**: `{{ strings.nav.home }}` or `{{ t.nav.home }}`
- **Language detection**: Based on first URL segment

### Frontmatter Keys (Collections)
**Packages**: `title`, `english_title`, `duration`, `category`, `difficulty`, `best_time`, `group_size`, `destinations: []`, `price_from`, `price_level`, `highlights: []`, `target_audience: []`

**Wildlife**: `title_cn`, `title_en`, `scientific_name`, `category`, `conservation_status`, `weight`, `length`, `lifespan`, `habitat`, `key_features: []`, `best_spots: []`

**Hotels**: `title`, `english_title`, `category`, `location`, `price_level`, `amenities: []`

**Destinations**: Similar pattern to packages/wildlife

**Blogs**: `title`, `author`, `date`, `trip_type`, `related_package`, `package_name`, `tags: []`

## Error Handling
- Ruby: Wrap in `begin/rescue` if external operations may fail
- Liquid: Use `{% raw %}{% if variable %}{% endraw %}` checks before outputting
- JavaScript: Check for null/undefined before accessing properties (`if (element && element.value)`)

## Common Patterns
- **Internal links**: `{{ site.baseurl }}/path/` (adds baseurl prefix)
- **Back links**: `[← Back]({{ site.baseurl }}/section/)`
- **Cross-references**: Link with `[Text]({{ site.baseurl }}/collection/slug)`
- **Search data**: Update both Ruby generators AND `assets/js/search.js`
- **Layout inheritance**: All content pages extend `default.html` via `layout: collection_name`

## When Adding Content
1. Add entry to relevant Ruby generator in `_scripts/`
2. Run generator: `ruby _scripts/generate_xxx.rb`
3. If needed, update `assets/js/search.js` with new keywords
4. Add localized versions to `en/` or `fr/` directories
5. Test with `bundle exec jekyll serve`
