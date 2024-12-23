---
layout: post
title: "En honor a la inspiración"
date: 2018-01-21 00:00:00 -0800
originaldate: 2018-01-21 00:00:00 -0800
categories: Comite-Editorial
tags: Comite-Editorial
author: Comite Editorial
---

¿Cuál es la motivación que nos inspira al escribir? ¿Es el lugar, tal vez el ambiente, las experiencias o simplemente la disciplina al crear? 

¿Importa lo mismo la forma que el contenido? ¿Es la mente la que domina las palabras con su sintonía racional, o es el puro sentimiento en bruto el que nos hace querer plasmar ideas? 

Compartimos algunas imágenes del hogar de Guillermo Del Toro, aclamado director, guionista, productor y novelista mexicano quien recientemente recibió un Globo de Oro a mejor director por su película La forma del Agua (The Shape of Water) entre muchos otros reconocimientos. 

Esperemos que estas imágenes sirvan de inspiración y les recordamos que ¡seguimos recibiendo textos! 

Bases: [www.elfuturodelayerhoy.com](https://www.elfuturodelayerhoy.com){:target="_blank"}

Para más información comunícate a: [info@elfuturodelayerhoy.com](mailto:info@elfuturodelayerhoy.com)

Si ya consultaste las bases, envía tu texto a: [contacto@elfuturodelayerhoy.com](mailto:contacto@elfuturodelayerhoy.com)

{% set images = [1, 2, 3, 4, 5, 6, 7] %}

{% for item in images %}
  <img src="{{site.baseurl | prepend: site.url}}/assets/{{ item }}.jpg" alt="{{ item }}-casa" /><br />
{% endfor %}
