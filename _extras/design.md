---
layout: page
title: Background and Design
permalink: /design/
---
There are a few things you need to know in order to understand why we
do things the way we do.  Some of them are specific to GitHub, rather
than Git itself.

1.  Git uses the term "clone" to mean "a copy of a repository".
    GitHub uses the term "fork" to mean, "a copy of a GitHub-hosted
    repo that is also hosted on GitHub", and the term "clone" to mean
    "a copy of a GitHub-hosted repo that's located on someone else's
    machine".  In both cases, the duplicate has a remote called
    `origin` that points to the original repo; other remotes can be
    added manually.

2.  A user on GitHub can only have one fork of a particular repo.
    This is a problem for us because an instructor may be involved in
    several workshops, each of which has its own website repo.  Those
    website repositories ought to be forks of this one, but since
    GitHub doesn't allow that, we have to use `import.github.com`.

3.  If a repository has a file called `README.md` in its root
    directory, GitHub displays the contents of that file on the
    repository's home page.

4.  If a repository has a branch called `gh-pages` (which stands for
    "GitHub pages"), then GitHub uses the HTML and Markdown files in
    that branch to create a website for the repository.  If the
    repository's URL is `http://github.com/darwin/finches`, the URL
    for the website is `http://darwin.github.io/finches`.

5.  If an HTML or Markdown file has a header consisting of three
    dashes, some data about the page, and three more dashes:

    ~~~
    ---
    key: value
    other_key: other_value
    ---
    stuff in the page
    ~~~

    then GitHub doesn't just copy the file over verbatim.  Instead, it
    runs the file through a translator called [Jekyll][jekyll] that
    looks for specially-formatted commands embedded in the file and
    uses them to fill in the page.

6.  Commands can be embedded in the body of a page.  One is
    `{% raw %}{% include something.html %}{% endraw %}`, which tells
    Jekyll to copy the contents of `something.html` into the file
    being translated; this is used to create standard headers and
    footers for pages.  Another is `{{variable}}`: when Jekyll sees
    this, it replaces it with the value of `variable`.  This is used
    to insert things like a contact email address and the URL for our
    Twitter account.

7.  Jekyll gets variables from two places: a file called `_config.yml`
    located in the repo's root directory, and the header of each
    individual page.  Variables from `_config.yml` are put in an
    object called `site`, and referred to as `site.variable`, so that
    (for example) `{{site.swc_site}}` in a page is replaced by the URL
    of the main Software Carpentry web site.  Variables from the
    page's header are put in an object called `page`, and referred to
    as `page.variable`, so if a page's header defines a variable
    called `venue`, `{{page.venue}}` is replaced by "Euphoric State
    University" (or whatever value the variable has).

8.  If a page uses `{% raw %}{% include something.html %}{% endraw %}`
    to include a snippet of HTML, Jekyll looks in a directory called
    `_includes` to find `something.html`.  It always looks there, and
    nowhere else, so anything we want people to be able to include in
    their pages has to be stored in `_includes`.

9.  A repository can have another special directory called `_layouts`.
    If a page like `index.html` has a variable called `layout`, and
    that variable's value is `standard.html`, Jekyll loads the file
    `_layouts/standard.html` and copies the content of `index.html`
    into it, then expands the result.  This is used to give the pages
    in a site a uniform appearance.
    We have created two layouts for workshop pages:

    * `workshop.html` is used for workshops' home pages, and is the
      layout for the `index.html` page in your repo's root directory.
      That `index.html` page's header must define several variables as
      specified in the the customization instructions in order for
      your workshop to be included in our main website.

    * `page.html` is used for any other pages you want to create.
      **Note:** if you create extra pages, you *must* edit the values
      in the top section of `_config.yml` as described in
      [the lesson template documentation]({{ site.example_site }}).

## Extra Directories

This workshop template shares resources with the template used for
Carpentry lessons.  As a result, your workshop website's repository
contains directories that most workshops don't need, but which can be
used to store extra material when necessary:

*   `_extras/`: extra pages (like this one).
*   `_episodes/`: lesson episodes (which workshops usually don't have).
*   `_episodes_rmd/`: R Markdown lesson episodes (if any).
*   `code/`: for code samples.
*   `data/`: for data files.
*   `fig/`: for figures and other images.
*   `files/`: for miscellaneous files.

For more information on these, please see [the documentation for the
lesson template]({{ site.example_site }}).

[jekyll]: https://jekyllrb.com/
