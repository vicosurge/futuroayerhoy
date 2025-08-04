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

<!-- Show ALL posts from _posts folder -->
{% if site.posts.size > 0 %}
  <section class="content-section">
    <h2>✉️ Comunicaciones del Comité Editorial</h2>
    <p class="section-description">Cartas, información y comunicados oficiales de la revista.</p>
    
    <div class="collection-summary">
      <p><strong>{{ site.posts.size }}</strong> {% if site.posts.size == 1 %}publicación disponible{% else %}publicaciones disponibles{% endif %}</p>
    </div>
    
    <ul class="post-list">
      {% assign sorted_posts = site.posts | sort: 'date' | reverse %}
      {% for post in sorted_posts %}
        <li class="post-item">
          <div class="post-meta">
            <time datetime="{{ post.date | date_to_xmlschema }}">
              {{ post.date | date: "%d de %B, %Y" }}
            </time>
            {% if post.author %}
              • Por <strong>{{ post.author }}</strong>
            {% endif %}
            {% if post.category %}
              • <span class="post-category">{{ post.category | replace: "-", " " | capitalize }}</span>
            {% endif %}
          </div>
          <h3 class="post-title">
            <a href="{{ post.url | relative_url }}">{{ post.title | escape }}</a>
          </h3>
          {% if post.excerpt %}
            <div class="post-excerpt">
              {{ post.excerpt | strip_html | truncatewords: 40 }}
            </div>
          {% endif %}
        </li>
      {% endfor %}
    </ul>
  </section>
{% endif %}

<!-- Convocatorias from collection (if any) -->
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

<!-- If nothing exists at all -->
{% if site.posts.size == 0 and site.convocatorias.size == 0 %}
  <div style="text-align: center; padding: 60px 20px; color: #666;">
    <p>Las cartas y convocatorias se están preparando para su publicación.</p>
    <p><em>Vuelve pronto para descubrir nuevas comunicaciones.</em></p>
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
</style>
