---
layout: page
title: Cartas y Convocatorias
permalink: /cartas/
---

<div class="category-header">
  <h1>📧 Cartas y Convocatorias</h1>
  <p class="category-description">
    Comunicaciones oficiales del comité editorial y convocatorias 
    para participar en nuestra revista literaria.
  </p>
</div>

<!-- Convocatorias from new collection -->
{% if site.convocatorias.size > 0 %}
  <section class="content-section">
    <h2>🎯 Convocatorias</h2>
    <p class="section-description">Llamados abiertos para la participación de escritores y artistas.</p>
    
    <ul class="post-list">
      {% assign sorted_convocatorias = site.convocatorias | sort: 'date' | reverse %}
      {% for convocatoria in sorted_convocatorias %}
        <li class="post-item">
          <div class="post-meta">
            <time datetime="{{ convocatoria.date | date_to_xmlschema }}">
              {{ convocatoria.date | date: "%d de %B, %Y" }}
            </time>
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
  </section>
{% endif %}

<!-- Cartas from _posts (if any remain) -->
{% assign cartas = site.posts | where: "category", "Carta" %}
{% if cartas.size > 0 %}
  <section class="content-section">
    <h2>✉️ Cartas del Comité</h2>
    <p class="section-description">Comunicaciones y reflexiones del comité editorial.</p>
    
    <ul class="post-list">
      {% assign sorted_cartas = cartas | sort: 'date' | reverse %}
      {% for carta in sorted_cartas %}
        <li class="post-item">
          <div class="post-meta">
            <time datetime="{{ carta.date | date_to_xmlschema }}">
              {{ carta.date | date: "%d de %B, %Y" }}
            </time>
            {% if carta.author %}
              • Por {{ carta.author }}
            {% endif %}
          </div>
          <h3 class="post-title">
            <a href="{{ carta.url | relative_url }}">{{ carta.title | escape }}</a>
          </h3>
          {% if carta.excerpt %}
            <div class="post-excerpt">
              {{ carta.excerpt | strip_html | truncatewords: 40 }}
            </div>
          {% endif %}
        </li>
      {% endfor %}
    </ul>
  </section>
{% endif %}

<!-- If no content exists -->
{% if site.convocatorias.size == 0 and cartas.size == 0 %}
  <div style="text-align: center; padding: 60px 20px; color: #666;">
    <p>Las cartas y convocatorias se están preparando para su publicación.</p>
    <p><em>Vuelve pronto para descubrir nuevas oportunidades de participación.</em></p>
  </div>
{% endif %}

<style>
.content-section {
  margin-bottom: 50px;
}

.content-section h2 {
  font-family: 'Crimson Text', serif;
  color: #2d5a3d;
  font-size: 1.6rem;
  margin-bottom: 10px;
  border-bottom: 2px solid #e8f5e8;
  padding-bottom: 10px;
}

.section-description {
  color: #666;
  font-style: italic;
  margin-bottom: 30px;
  font-size: 1rem;
}

.decorative-flourish {
  text-align: center;
  color: #4a7c59;
  font-size: 1.5rem;
  margin: 40px 0;
}

.decorative-flourish::before {
  content: "❦ ❦ ❦";
}
</style>
