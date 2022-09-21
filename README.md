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
   (<https://github.com/esciencecenter-digital-skills/workshop-template>),
   click on the green `Use this template` button (top right).

2.  Select the owner for your new repository. This should be
    `esciencecenter-digital-skills` GitHub organisation.

3.  Choose a name for your workshop website repository. This name should have
    the form `YYYY-MM-DD-carpentry-curriculum`, e.g., `2016-12-01-ds-gpu`, where
    `YYYY-MM-DD` is the start date of the workshop, `ds` stands for Digital
    Skills, and `gpu` is the workshop name in this example.

4.  Make sure the repository is public, leave "Include all branches" unchecked 
    (don't worry about the `gh-pages` branch, it will be created by a github action).
    Click on "Create repository from template". You will be redirected to
    your new copy of the workshop template repository.

4.  Go to the the workshop repository that is just created. 
    Manually run the 'Build and deploy Jekyll site to GitHub Pages' github action.
    See instructions for manually triggering workflows [here][manually-run-workflow]

6. Your new website will be rendered at
   `https://owner_name.github.io/YYYY-MM-DD-type-curriculum`. For example, if
   `esciencecenter-digital-skills` is the owner, the workshop's URL will be
   `https://esciencecenter-digital-skills.github.io/2021-11-02-ds-gpu/`.
   Please note that the github action that builds the website can take a few minutes to complete!

7. Click on "Settings" tab. In the left sidebar, click on "Pages". Under "GitHub Pages", use the
    _gh-pages_ branch from drop-down menu and press "save". For more information,
    see [GitHub
    documentation](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site).

7. Please do your work in the repository's `main` branch. A GitHub action is
   used for deployment that creates a `gh-pages` branch. See
   [building a Jekyll site using a GitHub Action][github-project-pages] for more information.

8. To trigger deployment of a new version of the website, [create a new release of your repository][create-release]

## Required information and customizing your workshop page

1. The file `data.csv` in `_data` directory contains the workshop information.
   See the [documention](./_data/README.md).

2. The file `eventbrite.json` in `_data` directory contains eventbrite code. See
   the [documention](./_data/README.md).

3. Additional lesson information lives in a folder in [workshop metadata
   repository](https://github.com/esciencecenter-digital-skills/workshop-metadata).
   See the
   [documention](https://github.com/esciencecenter-digital-skills/workshop-metadata#readme).

4. In some cases you want to deviate from the default lesson information (also known as 'workshop metadata').
   The steps are as follows:
   1. In the corresponding folder in the [workshop metadata
       repository](https://github.com/esciencecenter-digital-skills/workshop-metadata)
       add a new file. Give it a suitable name.
       For example, if you want a different schedule for your workshop create 
       a new file called `schedule-2.md` or `schedule-in-person.md`.
   2. Add the desired workshop information to the file and commit to the `main` branch.
   3. In the workshop repository edit the `index.md` file. 
      Find where the default workshop metadata markdown file that you want to replace is included.
      For example: the schedule.md file is included [here](https://github.com/esciencecenter-digital-skills/workshop-template/blob/main/index.md#schedule)
      Instead of the default file, point to your new file (i.e. `schedule-in-person.md`).
  4. Once you commit this, the github action will rebuild the workshop website. 
     The `index.md` file will point to the alternative workshop metadata markdown file,
     so that will be included in the workshop website.

5. There is a `collaborative_document.md` in the `files` directory of this
   repository. You can use it as a template to create a collaborative document
   on [hackmd](https://hackmd.io/). Please note that you need to sign in.
6. You can automatically create an exercises document.
   Manually run the 'Extract exercises' github action.
   See instructions for manually triggering workflows [here][manually-run-workflow]
   This will extract all exercises from the lesson material, and put them in files/exercises-document.md
   If it doesn't work automatically you can also manually use 
   [the python package that extracts the exercises](https://github.com/esciencecenter-digital-skills/carpentries-exercises-extractor)

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

and go to <http://0.0.0.0:4000> to preview your site. Alternatively, if you'd like to run Jekyll
inside a Docker container, you may run

```shell
make docker-serve
```

## Creating Extra Pages

In rare cases,
you may want to add extra pages to your workshop website.
You can do this by putting either Markdown or HTML pages in the website's root directory
and styling them according to the instructions given in
[the lesson template][lesson-example].

[create-release]: https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository#creating-a-release
[email]: mailto:training@esciencecenter.nl
[dc-site]: https://datacarpentry.org
[github-project-pages]: https://jekyllrb.com/docs/continuous-integration/github-actions/
[issues]: https://github.com/esciencecenter-digital-skills/next-workshop-template/issues
[lesson-example]: https://carpentries.github.io/lesson-example/
[manually-run-workflow]: https://docs.github.com/en/actions/managing-workflow-runs/manually-running-a-workflow#running-a-workflow
[swc-site]: https://software-carpentry.org
[lc-site]: https://librarycarpentry.org
[ds-site]: https://esciencecenter-digital-skills.github.io/
[setup-instructions]: https://carpentries.github.io/lesson-example/setup.html#jekyll-setup-for-lesson-development
