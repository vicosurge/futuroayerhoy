---
layout: page
title: Categorias
permalink: /categorias/
---
<h3>Poesia</h3>
{% for post in site.categories["Poesía"] %}
  <ul>
    <li>
      <a href="{{ post.url | relative_url }}" target="_blank">{{ post.title }}</a> de {{ post.author }} - {{ post.date | date: "%B %d, %Y" }}
    </li>
  </ul>
{% endfor %}
---
<h3>Historia Corta</h3>
{% for post in site.categories["Historia-Corta"] %}
  <ul>
    <li>
      <a href="{{ post.url | relative_url }}" target="_blank">{{ post.title }}</a> de {{ post.author }} - {{ post.date | date: "%B %d, %Y" }}
    </li>
  </ul>
{% endfor %}
---
<h3>Ensayo</h3>
{% for post in site.categories["Ensayo"] %}
  <ul>
    <li>
      <a href="{{ post.url | relative_url }}" target="_blank">{{ post.title }}</a> de {{ post.author }} - {{ post.date | date: "%B %d, %Y" }}
    </li>
  </ul>
{% endfor %}
