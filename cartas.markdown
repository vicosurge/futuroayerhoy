---
layout: page
title: Cartas
permalink: /cartas/
---
<h3>Cartas del Comite</h3>
{% for post in site.categories["Carta"] %}
  <ul>
    <li>
      <a href="{{ post.url | relative_url }}" target="_blank">{{ post.title }}</a> - {{ post.date | date: "%B %d, %Y" }}
    </li>
  </ul>
{% endfor %}

<h3>Convocatorias</h3>
{% for post in site.categories["Convocatoria"] %}
  <ul>
    <li>
      <a href="{{ post.url | relative_url }}" target="_blank">{{ post.title }}</a> - {{ post.date | date: "%B %d, %Y" }}
    </li>
  </ul>
{% endfor %}
