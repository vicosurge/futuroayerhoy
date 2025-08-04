---
layout: page
title: Convocatorias
permalink: /convocatorias/
---

<div class="category-header">
  <h1>📢 Convocatorias</h1>
  <p class="category-description">
    Llamados abiertos para la participación de escritores y artistas, 
    donde invitamos a nuevas voces a formar parte de nuestra comunidad literaria.
  </p>
</div>

{% if site.convocatorias.size > 0 %}
  <ul class="post-list">
    {% assign sorted_convocatorias = site.convocatorias | sort: 'date' | reverse %}
    {% for convocatoria in sorted_convocatorias %}
      <li class="post-item">
        <div class="post-meta">
          {% if convocatoria.date %}
            <time datetime="{{ convocatoria.date | date_to_xmlschema }}">
              {{ convocatoria.date | date: "%d de %B, %Y" }}
            </time>
          {% endif %}
          {% if convocatoria.author %}
            • Por {{ convocatoria.author }}
          {% endif %}
        </div>
        <h3 class="post-title">
          <a href="{{ convocatoria.url | relative_url }}">{{ convocatoria.title | escape }}</a>
        </h3>
        {% if convocatoria.excerpt %}
          <div class="post-excerpt">
            {{ convocatoria.excerpt | strip_html | truncatewords: 40 }}
          </div>
        {% endif %}
      </li>
    {% endfor %}
  </ul>
{% else %}
  <div style="text-align: center; padding: 60px 20px; color: #666;">
    <p>Las convocatorias se están preparando para su publicación.</p>
    <p><em>Vuelve pronto para descubrir nuevas oportunidades de participación.</em></p>
  </div>
{% endif %}
