---
layout: page
title: Installation Instructions
permalink: /install_instructions/index.html
tools:
  - editor
  - git
  - openrefine
  - python
  - r
  - shell
  - sql
  - videoconferencing
---

{% comment %}
To add a new set of installation instructions to this page:
1. Add the instructions (in HTML) as a new file in the `_includes` folder
2. Add the name of that file, without the .html extension,
   to the `tools` array in the YAML front matter of this page
   (i.e. between the --- above).
{% endcomment %}

{% for tool in page.tools %}
{% include install_instructions/{{tool}}.html %}
{% endfor %}
