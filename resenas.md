---
layout: page
title: Reseñas
permalink: /resenas/
---

<div class="category-header">
  <h1>📝 Reseñas</h1>
  <p class="category-description">
    Análisis críticos de obras literarias contemporáneas, 
    donde exploramos y discutimos las voces que definen nuestra época.
  </p>
</div>

{% if site.resenas.size > 0 %}
  <ul class="post-list">
    {% assign sorted_resenas = site.resenas | sort: 'date' | reverse %}
    {% for resena in sorted_resenas %}
      <li class="post-item">
        <div class="post-meta">
          {% if resena.date %}
            <time datetime="{{ resena.date | date_to_xmlschema }}">
              {{ resena.date | date: "%d de %B, %Y" }}
            </time>
          {% endif %}
          {% if resena.author %}
            • Por {{ resena.author }}
          {% endif %}
          {% if resena.book_title %}
            • Sobre "{{ resena.book_title }}"
          {% endif %}
        </div>
        <h3 class="post-title">
          <a href="{{ resena.url | relative_url }}">{{ resena.title | escape }}</a>
        </h3>
        {% if resena.excerpt %}
          <div class="post-excerpt">
            {{ resena.excerpt | strip_html | truncatewords: 40 }}
          </div>
        {% endif %}
      </li>
    {% endfor %}
  </ul>
{% else %}
  <div style="text-align: center; padding: 60px 20px; color: #666;">
    <p>Las reseñas se están preparando para su publicación.</p>
    <p><em>Vuelve pronto para descubrir nuevos análisis literarios.</em></p>
  </div>
{% endif %}
