# workshop-template

This repository is [Software Carpentry](http://software-carpentry.org)'s
template for creating websites for workshops.
Do *not* fork this repository directly on GitHub.
Instead, please follow the instructions below
to create a website repository for your workshop.
Please also read
[the notes on customizing your website](CUSTOMIZATION.md) and the [FAQ](FAQ.md).
If you're interested in knowing more about why we do things the way we do,
please check out the [design notes](DESIGN.md).

> If you are teaching Git,
> you should create a separate repository for learners to use in that lesson.
> You should not have them use the workshop website repository because:
> 
> *   your workshop website repository contains many files
>     that most learners don't need to see during the lesson,
>     and
> 
> *   you probably don't want to accidentally merge
>     a damaging pull request from a novice Git user
>     into your workshop's website while you are using it to teach.

Once you are done,
please **send your repository's URL to the Software Carpentry administrator**
so that it can be included in the main web site.

## Creating a Repository

1.  Go to [http://import.github.com](http://import.github.com).

2.  Enter the URL for this template repository, which is
    `https://github.com/swcarpentry/workshop-template`.

3.  Check the URL.  (GitHub won't import until you've done this.)

4.  Select the owner for your new repository.
    (This will probably be you, but may instead be an organization you belong to.)

5.  Choose a name for your workshop website repository.
    This name should have the form `YYYY-MM-DD-site`,
    e.g., `2015-07-01-miskatonic`.

6.  Make sure the repository is public.

7.  At this point, you should have a page like this:

    ![](http://software-carpentry.org/img/workshop-template/using-github-import.png)

    You can now click "Begin Import".
    When the process is done,
    you can click "Continue to repository" to visit your newly-created repository.

## Customizing Your Website

1.  Go into your newly-created repository,
    which will be at `http://github.com/your_username/YYYY-MM-DD-site`.
    For example,
    if `your_username` is `gvwilson`,
    the repository's URL will be `https://github.com/gvwilson/2015-07-01-mistaktonic`.

2.  Edit `index.html`.
    You can do this in the browser by clicking on it in the file view
    and then selecting the pencil icon in the menu bar:

    ![](http://software-carpentry.org/img/workshop-template/edit-index-file-menu-bar.png)

    or you can clone the repository to your desktop,
    edit `index.html` there,
    and push your changes back to the repository.

3.  When you are done editing,
    you can preview your website at its GitHub Pages URL,
    which is `http://your_id.github.com/YYYY-MM-DD-site`.
    For example,
    the URL for the website we have just created is
    `http://gvwilson.github.io/2015-07-01-miskatonic`.

4.  Edit `_config.yml` in the same way
    so that `lesson_repo` and `lesson_site`
    are the URLs of your repository (e.g., `https://github.com/gvwilson/2015-07-01-mistaktonic`)
    and your GitHub Pages website (e.g., `http://gvwilson.github.io/2015-07-01-miskatonic`).

Editing hints are embedded in `index.html`,
and full instructions are in [CUSTOMIZATION.md](CUSTOMIZATION.md).
This [FAQ](FAQ.md) includes a few extra tips
(additions are always welcome)
and these notes on [the background and design](DESIGN.md) of this template may help as well.

> We build the [list of workshops on the main website](http://software-carpentry.org/workshops/index.html)
> from the data included in your `index.html` page.
> We can only do that if you [customize](CUSTOMIZATION.md) that page correctly
> *and* send us a link to your workshop website.

## Checking Your Changes

No matter how you edit `index.html`, you should:

1.  Check your changes by running `tools/check.py` at the command line inside your repository.

2.  Preview your changes by running `tools/preview` and looking at `_site/index.html`.

For some links work properly,
particularly the one to your workshop's Eventbrite registration page,
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

## Getting Help

Mail us at [admin@software-carpentry.org](mailto:admin@software-carpentry.org),
or join our [discussion list](http://lists.software-carpentry.org/mailman/listinfo/discuss_lists.software-carpentry.org)
and ask for help there.

## Giving Help

We are committed to offering a pleasant setup experience for our learners and organizers.
If you find bugs in our instructions,
or would like to suggest improvements,
please [file an issue](https://github.com/swcarpentry/workshop-template/issues?q=is%3Aopen+is%3Aissue)
or [mail us](mailto:admin@software-carpentry.org).
