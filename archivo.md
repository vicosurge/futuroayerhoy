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
  </div>
</div>

<div class="decorative-flourish"></div>

<!-- Combine all collections and regular posts -->
{% assign all_content = site.posts | concat: site.cuentos | concat: site.poesia | concat: site.ensayos | concat: site.resenas %}
{% assign sorted_content = all_content | sort: 'date' | reverse %}

{% if sorted_content.size > 0 %}
  <!-- Group by year -->
  {% assign current_year = '' %}
  {% for item in sorted_content %}
    {% assign item_year = item.date | date: "%Y" %}
    
    {% if item_year != current_year %}
      {% unless forloop.first %}</ul>{% endunless %}
      <h2 class="year-header">{{ item_year }}</h2>
      <ul class="post-list">
      {% assign current_year = item_year %}
    {% endif %}
    
    <li class="post-item">
      <div class="post-meta">
        <time datetime="{{ item.date | date_to_xmlschema }}">
          {{ item.date | date: "%d de %B" }}
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
    
    {% if forloop.last %}
      </ul>
    {% endif %}
  {% endfor %}
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

.year-header {
  font-family: 'Crimson Text', serif;
  color: #2d5a3d;
  font-size: 1.8rem;
  margin: 50px 0 30px;
  padding: 15px 0;
  border-bottom: 2px solid #e8f5e8;
  text-align: center;
  position: relative;
}

.year-header::before {
  content: "";
  position: absolute;
  bottom: -2px;
  left: 50%;
  transform: translateX(-50%);
  width: 60px;
  height: 2px;
  background: #4a7c59;
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
