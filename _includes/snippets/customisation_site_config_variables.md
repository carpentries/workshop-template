{{"

The `_config.yml` configuration file in the root directory of your workshop needs to configure some site-wide variables and make the site function correctly:

`carpentry`
: Tell us which carpentry workshop this is:
    - `swc` for Software Carpentry workshops,
    - `dc` for Data Carpentry workshops,
    - `lc` for Library Carpentry workshops, and
    - `cp` for general Carpentries events such as instructor trainings (for which you should use
      <https://github.com/carpentries/training-template> as the website template).
    - `incubator` for workshops teaching a lesson in The Carpentries Incubator.

`curriculum`
: Tell us which curriculum is being taught:
  At the moment, applicable to Software and Data Carpentry workshops only.
  Possible values are:
    - `dc-astronomy`, `dc-ecology`, `dc-genomics`, `dc-socsci`, `dc-geospatial`, or `dc-image` for Data Carpentry
      workshops
    - `swc-inflammation` or `swc-gapminder` for Software Carpentry workshops.

`flavor`
: Tell us which style of lessons are being taught at the workshop **(currently only for Data Carpentry and Software Carpentry workshops).**
    - `r`
    - `python`

`pilot`
: Will this lesson be a pilot?
    - `true` if the workshop will be a lesson pilot, either of a new official lesson or a lesson in The Carpentries Incubator.
    - `false` if the workshop will be a regular lesson.

`title`
: The overall title for the workshop **(this variable is also used for the title of the extra pages)**
    - If set (i.e., different from 'Workshop Title' or empty), it will appear in the 'jumbotron' (the gray box at the top of the page).

    The README contains [more information about extra pages](https://github.com/carpentries/workshop-template#creating-extra-pages).

##### Slug Validation

For workshops teaching a core or mix and match curriculum, i.e. where `carpentry` is set to `swc`, `dc`, or `lc`, the website build will check that your repository name matches the Carpentries slug format - `YYYY-MM-DD-site[-online]`, e.g. `2024-05-07-oomza-online`.

**If your repository name does not match this format, the build will fail, and will direct you to rename your workshop website repository to a valid slug.**
You will then need to commit a change to the repo to rebuild the site, e.g. adding a space or other inconsequential change to the `README.md`.

Workshop websites using `cp` or `incubator` will go through the same check, but the build will not fail if the repo name does not match the slug format.
You will see a warning in the build output instead.

##### Incubator lessons

For workshops teaching lessons in The Carpentries Incubator, i.e. where `carpentry` is set to `incubator`, you should uncomment the following three fields in `_config.yml`:

* `incubator_lesson_site` - the URL of the lesson pages that will be taught at the workshop.
* `incubator_pre_survey` - the URL of the pre-workshop survey you have prepared for the pilot workshop. (The standard Carpentries pre- and post-workshop surveys should not be used for Incubator workshops).
* `incubator_post_survey` - the URL of the post-workshop survey you have prepared for the pilot workshop.

##### Site URL

GitHub Pages sites are formatted as `https://GITHUB_USERNAME.github.io/REPOSITORY_NAME`.

For example, if the URL for your repository is `https://github.com/gvwilson/2015-07-01-oomza`, the URL for its website will be `http://gvwilson.github.io/2015-07-01-oomza`.

" | markdownify }}