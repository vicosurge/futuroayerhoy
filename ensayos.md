## ensayos.md
---
layout: page
title: Ensayos
permalink: /ensayos/
---

<div class="category-header">
  <h1>💭 Ensayos</h1>
  <p class="category-description">
    Reflexiones profundas sobre literatura, cultura y sociedad, 
    donde el pensamiento crítico se encuentra con la exploración intelectual.
  </p>
</div>

{% if site.ensayos.size > 0 %}
  <ul class="post-list">
    {% assign sorted_ensayos = site.ensayos | sort: 'date' | reverse %}
    {% for ensayo in sorted_ensayos %}
      <li class="post-item">
        <div class="post-meta">
          {% if ensayo.date %}
            <time datetime="{{ ensayo.date | date_to_xmlschema }}">
              {{ ensayo.date | date: "%d de %B, %Y" }}
            </time>
          {% endif %}
          {% if ensayo.author %}
            • Por {{ ensayo.author }}
          {% endif %}
        </div>
        <h3 class="post-title">
          <a href="{{ ensayo.url | relative_url }}">{{ ensayo.title | escape }}</a>
        </h3>
        {% if ensayo.excerpt %}
          <div class="post-excerpt">
            {{ ensayo.excerpt | strip_html | truncatewords: 40 }}
          </div>
        {% endif %}
      </li>
    {% endfor %}
  </ul>
{% else %}
  <div style="text-align: center; padding: 60px 20px; color: #666;">
    <p>Los ensayos se están preparando para su publicación.</p>
    <p><em>Vuelve pronto para descubrir nuevas reflexiones.</em></p>
  </div>
{% endif %}

---
