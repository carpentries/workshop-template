# workshop-template

This repository is [Software Carpentry](http://software-carpentry.org)'s
template for creating websites for workshops.

1.  Do *not* fork this repository directly on GitHub.
    Instead, please follow the instructions below
    to create a website repository for your workshop.

2.  Once you are done,
    please **send your repository's URL to the Software Carpentry administrator**.
    We build the [list of workshops on the main website](http://software-carpentry.org/workshops/index.html)
    from the data included in your `index.html` page.
    We can only do that if you [customize](CUSTOMIZATION.md) that page correctly
    *and* send us a link to your workshop website.

3.  Please also read
    [the notes on customizing your website](CUSTOMIZATION.md) and the [FAQ](FAQ.md).
    If you're interested in knowing more about why we do things the way we do,
    please check out the [design notes](DESIGN.md).

4.  If you are teaching Git,
    please [create a separate repository](#setting-up-a-separate-repository-for-learners)
    for your learners to practice in.

5.  If you run into problems,
    or have ideas about how to make this process simpler,
    please [get in touch](#getting-and-giving-help).

## Creating a Repository

1.  Go to [http://import.github.com/new?import_url=https://github.com/swcarpentry/workshop-template](http://import.github.com/new?import_url=https://github.com/swcarpentry/workshop-template).

2.  Click on "Check the URL".  (GitHub won't import until you've done this.)

3.  Select the owner for your new repository.
    (This will probably be you, but may instead be an organization you belong to.)

4.  Choose a name for your workshop website repository.
    This name should have the form `YYYY-MM-DD-site`,
    e.g., `2015-07-01-miskatonic`.

5.  Make sure the repository is public.

6.  At this point, you should have a page like this:

    ![](http://software-carpentry.org/img/workshop-template/using-github-import.png)

    You can now click "Begin Import".
    When the process is done,
    you can click "Continue to repository" to visit your newly-created repository.

**Note:**
some people have had intermittent errors during the import process,
possibly because of the network timing out.
If you experience a problem, please re-try;
if the problem persists,
please [get in touch](#getting-and-giving-help).

To clone your new repository, use:

~~~
git clone -b gh-pages https://github.com/your_username/YYYY-MM-DD-site
~~~

This is needed because the imported repository doesn't have a `master` branch.

## Customizing Your Website

1.  Go into your newly-created repository,
    which will be at `https://github.com/your_username/YYYY-MM-DD-site`.
    For example,
    if `your_username` is `gvwilson`,
    the repository's URL will be `https://github.com/gvwilson/2015-07-01-mistaktonic`.

2.  Edit `index.html` to customize the list of instructors,
    workshop venue,
    etc.
    You can do this in the browser by clicking on it in the file view
    and then selecting the pencil icon in the menu bar:

    ![](http://software-carpentry.org/img/workshop-template/edit-index-file-menu-bar.png)

    or you can clone the repository to your desktop,
    edit `index.html` there,
    and push your changes back to the repository.

3.  Edit `_config.yml` in the same way
    so that `workshop_repo` and `workshop_site`
    are the URLs of your repository and your GitHub Pages website respectively.

    Note: the URL for your website is determined automatically
    based on the URL for your repository.
    If your repository is at `https://github.com/gvwilson/2015-07-01-mistaktonic`,
    its GitHub Pages website is at `http://gvwilson.github.io/2015-07-01-miskatonic`.

4.  When you are done editing,
    you can preview your website.
    Again,
    if your repository is `https://github.com/your_username/YYYY-MM-DD-site`,
    its website will be `http://your_username.github.io/YYYY-MM-DD-site`.

Editing hints are embedded in `index.html`,
and full instructions are in [CUSTOMIZATION.md](CUSTOMIZATION.md).
This [FAQ](FAQ.md) includes a few extra tips
(additions are always welcome)
and these notes on [the background and design](DESIGN.md) of this template may help as well.

## Checking Your Changes

No matter how you edit `index.html`, you should:

1.  Check your changes by running `tools/check.py` at the command line
    from the root directory of your repository.

2.  Preview your changes by running `tools/preview` and looking at `_site/index.html`.
    To be able to preview your page locally,
    you must install Ruby 1.9.3 or greater plus `github-pages`,
    as described [below](#installing-software).

For some links to work properly,
particularly the link to your workshop's Eventbrite registration page,
you must view `_site/index.html` using an HTTP server.
If you have Jekyll installed,
you can do this by running:

~~~
$ jekyll server -d _site
~~~

and going to http://localhost:4000.

## Installing Software

In order to preview the workshop website locally on your computer,
you must install the software described below.

> If you aren't able to install this software (or you just can't be
> bothered), you can still create a website for your workshop.  Every
> time you push a change to your website respository the live website
> will update automatically, so you can check your changes on the live
> site instead of locally.

1.  Jekyll 1.0.3

    1. Check if Ruby is installed and find its version using command line:

        ~~~
        $  ruby -v
        ~~~

        The following commands need a minimum version of 1.9.3.

    2. Install `github-pages`:

        ~~~
        $ gem install github-pages
        ~~~

        or if that doesn't work:

        ~~~
        $ gem install jekyll
        $ gem install kramdown
        ~~~

        We use Kramdown to translate Markdown into HTML, instead of
        the default Redcarpet, because Kramdown handles Markdown
        inside HTML blocks.

2.  The Python YAML module

    If you are using the Anaconda Python distribution, you probably
    already have it; if you don't, you can install it with:

    ~~~
    $ conda install pyyaml
    ~~~

    If you are using some other distribution, you can install the
    Python YAML module using Pip:

    ~~~
    $ pip install pyyaml
    ~~~

    and if you are on Debian Linux, you can use:

    ~~~
    $ apt-get install python-yaml
    ~~~

## Setting Up a Separate Repository for Learners

If you are teaching Git,
you should create a separate repository for learners to use in that lesson.
You should not have them use the workshop website repository because:

*   your workshop website repository contains many files
    that most learners don't need to see during the lesson,
    and

*   you probably don't want to accidentally merge
    a damaging pull request from a novice Git user
    into your workshop's website while you are using it to teach.

You can call this repository whatever you like,
and add whatever content you need to it.

## Getting and Giving Help

Mail us at [admin@software-carpentry.org](mailto:admin@software-carpentry.org),
or join our [discussion list](http://lists.software-carpentry.org/mailman/listinfo/discuss_lists.software-carpentry.org)
and ask for help there.

We are committed to offering a pleasant setup experience for our learners and organizers.
If you find bugs in our instructions,
or would like to suggest improvements,
please [file an issue](https://github.com/swcarpentry/workshop-template/issues)
or [mail us](mailto:admin@software-carpentry.org).
