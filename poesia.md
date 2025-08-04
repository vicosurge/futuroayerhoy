## poesia.md
---
layout: page
title: Poesía
permalink: /poesia/
---

<div class="category-header">
  <h1>✨ Poesía</h1>
  <p class="category-description">
    Versos que capturan emociones, imágenes y reflexiones líricas, 
    donde las palabras danzan para crear mundos de belleza y significado.
  </p>
</div>

{% if site.poesia.size > 0 %}
  <ul class="post-list">
    {% assign sorted_poesia = site.poesia | sort: 'date' | reverse %}
    {% for poema in sorted_poesia %}
      <li class="post-item">
        <div class="post-meta">
          {% if poema.date %}
            <time datetime="{{ poema.date | date_to_xmlschema }}">
              {{ poema.date | date: "%d de %B, %Y" }}
            </time>
          {% endif %}
          {% if poema.author %}
            • Por {{ poema.author }}
          {% endif %}
        </div>
        <h3 class="post-title">
          <a href="{{ poema.url | relative_url }}">{{ poema.title | escape }}</a>
        </h3>
        {% if poema.excerpt %}
          <div class="post-excerpt">
            {{ poema.excerpt | strip_html | truncatewords: 30 }}
          </div>
        {% endif %}
      </li>
    {% endfor %}
  </ul>
{% else %}
  <div style="text-align: center; padding: 60px 20px; color: #666;">
    <p>Los poemas se están preparando para su publicación.</p>
    <p><em>Vuelve pronto para descubrir nuevos versos.</em></p>
  </div>
{% endif %}

---
