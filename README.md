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

2.  Select the owner for your new repository. This will probably be you, but may
    instead be an organization you belong to e.g.
    `esciencecenter-digital-skills`.

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
   used for deployment that creats a `gh-pages` branch, see
   [building a Jekyll site usin a GitHub Action][github-project-pages] for more information.


## Required information 

1. The file `data.csv` in `_data` directory of this repository contains the
   workshop information:

- venue: brief name of the institution that hosts the workshop without address
(e.g., "eScience Center")

- address: full street address of workshop (e.g., "Science Park 140, 1098 XG
  Amsterdam")

- country: country for the institution that hosts the workshop (e.g.,
  Netherlands)

- latitude: decimal latitude of workshop venue, use https://www.latlong.net/
  (e.g., 52.35695685)

- longitude: decimal longitude of the workshop venue, use
  https://www.latlong.net (e.g., 4.95433748205789)

- humandate: human-readable dates for the workshop (e.g., "December 24 - 26,
  2021, CET")

- humantime: human-readable times for the workshop (e.g., "7:00 - 9:00")

- startdate: machine-readable start date for the workshop (e.g.,
  "2021-12-24T00:00:00Z")

- enddate: machine-readable end date for the workshop (e.g.,
  "2021-12-26T00:00:00Z")

- instructor: comma-separated list of instructors' names as strings (e.g.,
  "Johan Hidding, Lieke de Boer, Mateusz Kuzak")

- helper: comma-separated list of helpers' names, (e.g., ,"Pushpanjali Pawar,
  Thijs van Lankveld")

- carpentry: "ds" for eScience Center Digital Skills, "swc" for Software
  Carpentry, "dc" for Data Carpentry, and "lc" for Library Carpentry.

- curriculum: lesson name (e.g. "ds-parallel")

- title: the title of the workshop (e.g. "Christmas special test workshop")

- slug: the name of workshop repository (e.g. "2021-12-24-dc-socsci-R-nlesc")

- flavor: the programming language used in the workshop (e.g. "R")

2. The file `repositories.csv` in `_data` directory of this repository contains the
   links of the lessons (in GitHub):

3. The folder `_meta` in the lesson repository contains lesson information:


## Customizing your workshop page

1. Edit `data.csv` in `_data` directory of this repository: You can do this in
   the browser on GitHub or generates it by: FIXME

2. Edit files in the folder `_meta` in the lesson repository.

3.  Edit `_config.yml` to customize certain site-wide variables, such as: `carpentry` (to tell your
    participants the lesson program for your workshop), `curriculum` and `flavor` for the
    curriculum  taught in your workshop, and `title` (overall title for all pages).

    Editing hints are embedded in `_config.yml`,
    and full instructions are in [the customization instructions][customization].

5. Edit the `schedule.html` file to edit the schedule for your upcoming workshop. This file is
   located in the `_includes` directory, make sure to choose the one from the appropriate `dc` (Data
   Carpentry workshop), `lc` (Library Carpentry), or `swc` (Software Carpentry) subdirectory.

### Working locally

> Note: you don't have to do this, if you have already updated your site using the web interface.


If you are already familiar with Git, you can clone the repository to your desktop, edit `index.md`,
`_config.yml`, and `schedule.html` following the instruction above there, and push your changes back to the repository.

```shell
git clone https://github.com/your_username/YYYY-MM-DD-site
```

In order to view your changes once you are done editing, if you have bundler installed (see the
[installation instructions below](#installing-software)), you can preview your site locally with:

```shell
make serve
```
and go to <http://0.0.0.0:4000> to preview your site.

Before pushing your changes to your repository, we recommend that you also check for any potential
issues with your site by running:

```shell
make workshop-check
```

Once you are satisfied with the edits to your site, commit and push the changes to your repository.
A few minutes later, you can go to the GitHub Pages URL for your workshop site and preview it. In the example above, this is `https://gvwilson.github.io/2016-12-01-oomza`. [The finished
page should look something like this](fig/completed-page.png?raw=true).


## Optional but Recommended Steps


### Update your repository description and link your website

At the top of your repository on GitHub you'll see

~~~
No description, website, or topics provided. — Edit
~~~

Click 'Edit' and add:

1.  A very brief description of your workshop in the "Description" box (e.g., "Oomza University workshop, Dec. 2016")

2.  The URL for your workshop in the "Website" box (e.g., `https://gvwilson.github.io/2016-12-01-oomza`)

This will help people find your website if they come to your repository's home page.

### Update the content of the README file

You can change the `README.md` file in your website's repository, which contains these instructions,
so that it contains a short description of your workshop and a link to the workshop website.


## Additional Notes

**Note:**
please do all of your work in your repository's `gh-pages` branch,
since [GitHub automatically publishes that as a website][github-project-pages].

**Note:**
this template includes some files and directories that most workshops do not need,
but which provide a standard place to put extra content if desired.
See the [design notes][design] for more information about these.

Further instructions are available in [the customization instructions][customization].
This [FAQ][faq] includes a few extra tips (additions are always welcome)
and these notes on [the background and design][design] of this template may help as well.


## Creating Extra Pages

In rare cases,
you may want to add extra pages to your workshop website.
You can do this by putting either Markdown or HTML pages in the website's root directory
and styling them according to the instructions give in
[the lesson template][lesson-example].


## Installing Software

If you want to set up Jekyll so that you can preview changes on your own machine before pushing them
to GitHub, you must install the software described in the lesson example [setup
instructions](https://carpentries.github.io/lesson-example/setup.html#jekyll-setup-for-lesson-development).

## Setting Up a Separate Repository for Learners

If you are teaching Git,
you should create a separate repository for learners to use in that lesson.
You should not have them use the workshop website repository because:

* your workshop website repository contains many files that most learners don't need to see during
  the lesson, and

* you probably don't want to accidentally merge a damaging pull request from a novice Git user into
  your workshop's website while you are using it to teach.

You can call this repository whatever you like, and add whatever content you need to it.


[email]: mailto:training@esciencecenter.nl
[customization]: https://carpentries.github.io/workshop-template/customization/index.html
[dc-site]: https://datacarpentry.org
[design]: https://carpentries.github.io/workshop-template/design/index.html
[faq]: https://carpentries.github.io/workshop-template/faq/index.html
[github-project-pages]: https://jekyllrb.com/docs/continuous-integration/github-actions/
[issues]: https://github.com/esciencecenter-digital-skills/next-workshop-template/issues
[lesson-example]: https://carpentries.github.io/lesson-example/
[self-organized-workshop-form]: https://amy.carpentries.org/forms/self-organised/
[swc-site]: https://software-carpentry.org
[lc-site]: https://librarycarpentry.org
[ds-site]: https://esciencecenter-digital-skills.github.io/
