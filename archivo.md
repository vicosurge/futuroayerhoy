---
layout: page
title: Archivo
permalink: /archivo/
---

<div class="category-header">
  <h1>📚 Archivo Completo</h1>
  <p class="category-description">
    Todos los textos publicados en El futuro del ayer, hoy, 
    organizados cronológicamente para tu exploración.
  </p>
</div>

<div class="archive-stats">
  <div class="stats-grid">
    <div class="stat-item">
      <span class="stat-number">{{ site.cuentos.size }}</span>
      <span class="stat-label">Cuentos</span>
    </div>
    <div class="stat-item">
      <span class="stat-number">{{ site.poesia.size }}</span>
      <span class="stat-label">Poemas</span>
    </div>
    <div class="stat-item">
      <span class="stat-number">{{ site.ensayos.size }}</span>
      <span class="stat-label">Ensayos</span>
    </div>
    <div class="stat-item">
      <span class="stat-number">{{ site.resenas.size }}</span>
      <span class="stat-label">Reseñas</span>
    </div>
    <div class="stat-item">
      <span class="stat-number">{{ site.convocatorias.size }}</span>
      <span class="stat-label">Convocatorias</span>
    </div>
    <div class="stat-item">
      <span class="stat-number">{{ site.posts.size }}</span>
      <span class="stat-label">Otros</span>
    </div>
  </div>
</div>

<div class="decorative-flourish"></div>

<!-- Simple approach: Just list all content in one big list -->
{% assign all_content = '' | split: '' %}
{% assign all_content = all_content | concat: site.posts %}
{% if site.cuentos.size > 0 %}
  {% assign all_content = all_content | concat: site.cuentos %}
{% endif %}
{% if site.poesia.size > 0 %}
  {% assign all_content = all_content | concat: site.poesia %}
{% endif %}
{% if site.ensayos.size > 0 %}
  {% assign all_content = all_content | concat: site.ensayos %}
{% endif %}
{% if site.resenas.size > 0 %}
  {% assign all_content = all_content | concat: site.resenas %}
{% endif %}
{% if site.convocatorias.size > 0 %}
  {% assign all_content = all_content | concat: site.convocatorias %}
{% endif %}

{% assign sorted_content = all_content | sort: 'date' | reverse %}

{% if sorted_content.size > 0 %}
  <h2 style="text-align: center; font-family: 'Crimson Text', serif; color: #2d5a3d; margin-bottom: 30px;">
    Todos los Textos ({{ sorted_content.size }} publicaciones)
  </h2>
  
  <ul class="post-list">
    {% for item in sorted_content %}
      <li class="post-item">
        <div class="post-meta">
          <time datetime="{{ item.date | date_to_xmlschema }}">
            {{ item.date | date: "%d de %B, %Y" }}
          </time>
          {% if item.collection %}
            • <span class="post-category">{{ item.collection | capitalize }}</span>
          {% elsif item.category %}
            • <span class="post-category">{{ item.category | capitalize }}</span>
          {% endif %}
          {% if item.author %}
            • Por {{ item.author }}
          {% endif %}
        </div>
        <h3 class="post-title">
          <a href="{{ item.url | relative_url }}">{{ item.title | escape }}</a>
        </h3>
        {% if item.excerpt %}
          <div class="post-excerpt">
            {{ item.excerpt | strip_html | truncatewords: 35 }}
          </div>
        {% endif %}
      </li>
    {% endfor %}
  </ul>
{% else %}
  <div style="text-align: center; padding: 60px 20px; color: #666;">
    <p>El archivo está siendo preparado.</p>
    <p><em>Vuelve pronto para explorar todos nuestros textos.</em></p>
  </div>
{% endif %}

<style>
.archive-stats {
  margin: 40px 0 60px;
  text-align: center;
}

.stats-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
  gap: 20px;
  max-width: 600px;
  margin: 0 auto;
}

.stat-item {
  background: white;
  padding: 20px;
  border-radius: 12px;
  box-shadow: 0 2px 10px rgba(45, 90, 61, 0.06);
  border-top: 3px solid #4a7c59;
}

.stat-number {
  display: block;
  font-size: 2rem;
  font-weight: 600;
  color: #2d5a3d;
  font-family: 'Inter', sans-serif;
}

.stat-label {
  display: block;
  font-size: 0.9rem;
  color: #666;
  margin-top: 5px;
  font-family: 'Crimson Text', serif;
}

@media screen and (max-width: 600px) {
  .stats-grid {
    grid-template-columns: repeat(2, 1fr);
    gap: 15px;
  }
  
  .stat-item {
    padding: 15px;
  }
  
  .stat-number {
    font-size: 1.5rem;
  }
}
</style>
