---
layout: page
title: Cuentos
permalink: /cuentos/
---

<div class="category-header">
  <h1>📖 Cuentos</h1>
  <p class="category-description">
    Narrativas breves que exploran la condición humana y mundos imaginarios, 
    donde cada historia es una ventana a experiencias únicas y reflexiones profundas.
  </p>
</div>

{% if site.cuentos.size > 0 %}
  <ul class="post-list">
    {% assign sorted_cuentos = site.cuentos | sort: 'date' | reverse %}
    {% for cuento in sorted_cuentos %}
      <li class="post-item">
        <div class="post-meta">
          {% if cuento.date %}
            <time datetime="{{ cuento.date | date_to_xmlschema }}">
              {{ cuento.date | date: "%d de %B, %Y" }}
            </time>
          {% endif %}
          {% if cuento.author %}
            • Por {{ cuento.author }}
          {% endif %}
        </div>
        <h3 class="post-title">
          <a href="{{ cuento.url | relative_url }}">{{ cuento.title | escape }}</a>
        </h3>
        {% if cuento.excerpt %}
          <div class="post-excerpt">
            {{ cuento.excerpt | strip_html | truncatewords: 40 }}
          </div>
        {% endif %}
      </li>
    {% endfor %}
  </ul>
{% else %}
  <div style="text-align: center; padding: 60px 20px; color: #666;">
    <p>Los cuentos se están preparando para su publicación.</p>
    <p><em>Vuelve pronto para descubrir nuevas narrativas.</em></p>
  </div>
{% endif %}
