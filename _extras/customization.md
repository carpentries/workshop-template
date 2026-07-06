---
layout: page
title: Customizing Your Workshop's Website
permalink: /customization/index.html
---

<div class="card mb-2">
  <h4 class="card-header">Site Configuration</h4>
  <div class="card-body">

    {% include snippets/customisation_site_config_variables.md %}

    <div class="alert alert-info" role="alert">
      You should not need to modify any of the other variable values in `_config.yml`.
    </div>
  </div>
</div>

<div class="card mb-2">
  <h4 class="card-header">YAML Header</h4>
  <div class="card-body">

    {% include snippets/customisation_yaml_header.md %}

  </div>
</div>

<div class="card mb-2">
  <h4 class="card-header">Schedule</h4>
  <div class="card-body">

    {% include snippets/customisation_schedule.md %}

  </div>
</div>

<div class="card mb-2">
  <h4 class="card-header">Setup Instructions</h4>
  <div class="card-body">

    {% include snippets/customisation_setup_instructions.md %}

  </div>
</div>

<div class="card mb-2">
  <h4 class="card-header">Who Can Attend</h4>
  <div class="card-body">
    <p>
        If you want to specify who can attend the workshop you are advertising, there is a commented-out section in `index.md` that you can use to inform workshop website visitors of who can attend the event.
        You may want to specify that only members of your university, department, etc. can attend or that the event is open to the public.
    </p>
    <p>
        We don't provide templated text for this as each situation is different.
        We do provide a section, called "Who can attend?" for you to specify this information.
    </p>
    <p>
        To use it, move the <code>{% raw %}{% endcomment %}{% endraw %}</code> line above the <code>{% raw %}&lt;p&gt;{% endraw %}</code> tag marking the beginning of this section and edit the paragraph to reflect the attendance policy for your workshop.
    </p>
  </div>
</div>


<div class="card mb-2">
  <h4 class="card-header">Updating the Repository</h4>
  <div class="card-body">

    {% include snippets/customisation_updating_repo.md %}

  </div>
</div>

{% include links.md %}
