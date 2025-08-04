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

<!-- Debug: Let's see what we have -->
{% comment %}
Debug info:
- Posts with "Carta": {{ site.posts | where: "category", "Carta" | size }}
- Posts with "Comite-Editorial": {{ site.posts | where: "category", "Comite-Editorial" | size }}
- Posts with "Informacion": {{ site.posts | where: "category", "Informacion" | size }}
{% endcomment %}

<!-- Cartas del Comité Editorial -->
{% assign all_cartas = '' | split: '' %}

<!-- Add all editorial content step by step -->
{% for post in site.posts %}
  {% if post.category == "Carta" or post.category == "Comite-Editorial" or post.category == "Informacion" %}
    {% assign all_cartas = all_cartas | push: post %}
  {% endif %}
{% endfor %}

{% if all_cartas.size > 0 %}
  <section class="content-section">
    <h2>✉️ Cartas del Comité Editorial</h2>
    <p class="section-description">Comunicaciones, reflexiones e información del comité editorial.</p>
    
    <div class="collection-summary">
      <p><strong>{{ all_cartas.size }}</strong> {% if all_cartas.size == 1 %}comunicación disponible{% else %}comunicaciones disponibles{% endif %}</p>
    </div>
    
    <ul class="post-list">
      {% assign sorted_cartas = all_cartas | sort: 'date' | reverse %}
      {% for carta in sorted_cartas %}
        <li class="post-item">
          <div class="post-meta">
            <time datetime="{{ carta.date | date_to_xmlschema }}">
              {{ carta.date | date: "%d de %B, %Y" }}
            </time>
            {% if carta.author %}
              • Por <strong>{{ carta.author }}</strong>
            {% endif %}
            {% if carta.category %}
              • <span class="post-category">{{ carta.category | replace: "-", " " | capitalize }}</span>
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

<!-- Convocatorias from collection -->
{% if site.convocatorias.size > 0 %}
  <section class="content-section">
    <h2>🎯 Convocatorias</h2>
    <p class="section-description">Llamados abiertos para la participación de escritores y artistas.</p>
    
    <div class="collection-summary">
      <p><strong>{{ site.convocatorias.size }}</strong> {% if site.convocatorias.size == 1 %}convocatoria disponible{% else %}convocatorias disponibles{% endif %}</p>
    </div>
    
    <ul class="post-list">
      {% assign sorted_convocatorias = site.convocatorias | sort: 'date' | reverse %}
      {% for convocatoria in sorted_convocatorias %}
        <li class="post-item">
          <div class="post-meta">
            <time datetime="{{ convocatoria.date | date_to_xmlschema }}">
              {{ convocatoria.date | date: "%d de %B, %Y" }}
            </time>
            {% if convocatoria.author %}
              • Por <strong>{{ convocatoria.author }}</strong>
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

<!-- Convocatorias from _posts (legacy) -->
{% assign convocatorias_posts = '' | split: '' %}
{% for post in site.posts %}
  {% if post.category == "Convocatoria" %}
    {% assign convocatorias_posts = convocatorias_posts | push: post %}
  {% endif %}
{% endfor %}

{% if convocatorias_posts.size > 0 %}
  <section class="content-section">
    {% if site.convocatorias.size == 0 %}
      <h2>🎯 Convocatorias</h2>
      <p class="section-description">Llamados abiertos para la participación de escritores y artistas.</p>
    {% else %}
      <h3>Convocatorias Adicionales</h3>
    {% endif %}
    
    <ul class="post-list">
      {% assign sorted_conv_posts = convocatorias_posts | sort: 'date' | reverse %}
      {% for convocatoria in sorted_conv_posts %}
        <li class="post-item">
          <div class="post-meta">
            <time datetime="{{ convocatoria.date | date_to_xmlschema }}">
              {{ convocatoria.date | date: "%d de %B, %Y" }}
            </time>
            {% if convocatoria.author %}
              • Por <strong>{{ convocatoria.author }}</strong>
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

<!-- Show debug info if no content found -->
{% if all_cartas.size == 0 and site.convocatorias.size == 0 and convocatorias_posts.size == 0 %}
  <div class="debug-section">
    <h3>Debug Information</h3>
    <p>Total posts in site: {{ site.posts.size }}</p>
    <p>Categories found:</p>
    <ul>
      {% assign categories = site.posts | map: 'category' | uniq %}
      {% for category in categories %}
        <li>{{ category }} ({{ site.posts | where: 'category', category | size }} posts)</li>
      {% endfor %}
    </ul>
  </div>
  
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

.content-section h3 {
  font-family: 'Crimson Text', serif;
  color: #4a7c59;
  font-size: 1.3rem;
  margin-bottom: 10px;
}

.section-description {
  color: #666;
  font-style: italic;
  margin-bottom: 30px;
  font-size: 1rem;
}

.collection-summary {
  text-align: center;
  margin: 20px 0 30px;
  padding: 15px;
  background: #f0f9f0;
  border-radius: 8px;
  border-left: 4px solid #4a7c59;
}

.collection-summary p {
  margin: 0;
  color: #2d5a3d;
  font-size: 1rem;
}

.post-category {
  color: #4a7c59;
  font-weight: 500;
}

.debug-section {
  background: #fff3cd;
  border: 1px solid #ffeaa7;
  padding: 20px;
  border-radius: 8px;
  margin-bottom: 30px;
}

.debug-section h3 {
  color: #856404;
  margin-bottom: 15px;
}

.debug-section ul {
  margin-left: 20px;
}
</style>
