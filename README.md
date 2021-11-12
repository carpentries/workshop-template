[![Build Jekyll site](https://github.com/esciencecenter-digital-skills/next-workshop-template/actions/workflows/jekyll.yml/badge.svg)](https://github.com/esciencecenter-digital-skills/next-workshop-template/actions/workflows/jekyll.yml)

# The Workshop Template

This repository is a template for creating a workshop page for [eScience Center
Digital Skills][ds-site], and the Carpentries [Software Carpentry][swc-site],
[Data Carpentry][dc-site], [Library Carpentry][lc-site].
We are committed to offering a pleasant setup experience for our learners and
organizers. If you run into problems, or would like to suggest improvements,
please [submit an issue][issues] or [mail us][email].

## Use this template

1. **Please _do not fork this repository directly on GitHub._** Instead,
   use GitHub's function to copy this template repository and customize it for
   your workshop. On this page
   (<https://github.com/esciencecenter-digital-skills/next-workshop-template>),
   click on the green `Use this template` button (top right).

2.  Select the owner for your new repository. This should be
    `esciencecenter-digital-skills` GitHub organisation.

3.  Choose a name for your workshop website repository. This name should have
    the form `YYYY-MM-DD-carpentry-curriculum`, e.g., `2016-12-01-ds-gpu`, where
    `YYYY-MM-DD` is the start date of the workshop, `ds` stands for Digital
    Skills, and `gpu` is the workshop name in this example.

4.  Make sure the repository is public, leave "Include all branches" unchecked,
    and click on "Create repository from template". You will be redirected to
    your new copy of the workshop template repository.

5. Your new website will be rendered at
   `https://owner_name.github.io/YYYY-MM-DD-type-curriculum`. For example, if
   `esciencecenter-digital-skills` is the owner, the workshop's URL will be
   `https://esciencecenter-digital-skills.github.io/2021-11-02-ds-gpu/`.

6. Please do your work in the repository's `main` branch. A GitHub action is
   used for deployment that creates a `gh-pages` branch, see
   [building a Jekyll site using a GitHub Action][github-project-pages] for more information.

## Required information and customizing your workshop page

1. The file `data.csv` in `_data` directory contains the workshop information.
   See the [documention](./_data/README.md).

2. The file `eventbrite.json` in `_data` directory contains eventbrite code. See
   the [documention](./_data/README.md).

3. The file `repositories.csv` in `_data` directory contains links to the
  lessons on GitHub.
  <!-- TODO move  repositories.csv to config.yml-->

4. The folder `_meta` in the lesson repository contains lesson information. See
   the [documention](FIXME).
   <!-- TODO add links to next-lesson-template-->

5. Edit `_config.yml` to customize certain site-wide variables, such as:
    `carpentry` (to tell your participants the lesson program for your
    workshop), `curriculum` and `flavor` for the curriculum taught in your
    workshop, and `title` (overall title for all pages).

6. There is a `collaborative_document.md` in the `files` directory of this
   repository. You can use it as a template to create a collaborative document
   on [hackmd](https://hackmd.io/). Please note that you need to sign in.

If you are already familiar with Git, you can clone the lesson and workshop
repositories, and edit these files. Then push your changes back to the
repository. Otherwise, you can edit files using the GitHub web interface.

## Preview changes locally

If you want to set up Jekyll so that you can preview changes on your own machine
before pushing them to GitHub, you must install the software described in the
lesson example 
[setup instructions][setup-instructions].
Then, you can preview your site locally with:

```shell
make serve
```

and go to <http://0.0.0.0:4000> to preview your site.

## Creating Extra Pages

In rare cases,
you may want to add extra pages to your workshop website.
You can do this by putting either Markdown or HTML pages in the website's root directory
and styling them according to the instructions given in
[the lesson template][lesson-example].

[email]: mailto:training@esciencecenter.nl
[dc-site]: https://datacarpentry.org
[github-project-pages]: https://jekyllrb.com/docs/continuous-integration/github-actions/
[issues]: https://github.com/esciencecenter-digital-skills/next-workshop-template/issues
[lesson-example]: https://carpentries.github.io/lesson-example/
[swc-site]: https://software-carpentry.org
[lc-site]: https://librarycarpentry.org
[ds-site]: https://esciencecenter-digital-skills.github.io/
[setup-instructions]: https://carpentries.github.io/lesson-example/setup.html#jekyll-setup-for-lesson-development
