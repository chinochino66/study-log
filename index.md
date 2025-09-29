---
title: Study Log
layout: default
---

# study-log

Daily study log. One commit per day (JST). File path: `logs/YYYY/MM/YYYY-MM-DD.md`.

## Entries

<ul class="postlist">
{%- assign pages_sorted = site.pages | sort: "path" | reverse -%}
{%- for p in pages_sorted -%}
  {%- if p.path contains 'logs/' and p.url != '/' -%}
    <li><a href="{{ p.url | relative_url }}">{{ p.title | default: p.path }}</a></li>
  {%- endif -%}
{%- endfor -%}
</ul>
