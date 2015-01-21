# workshop-template

This repository is [Software Carpentry](http://software-carpentry.org)'s
template for creating websites for workshops.  Do *not* fork this
repository directly on GitHub.  Instead, follow the instructions below
to create a website repository for your workshop (and possibly a
second repository for your learners to use in your Git lessons).

> If you are teaching Git, you should create a separate repository for
> learners to use in that lesson.  You should not have them use the
> workshop website repository because:
> 
> *   your workshop website repository contains many files that
>     most learners don't need to see during the lesson, and
> 
> *   you probably don't want to accidentally merge a damaging pull
>     request from a novice Git user into your workshop's website while
>     you are using it to teach.

## Semi-Automated Setup

1.  Download the workshop website creation script from
    [http://files.software-carpentry.org/swc-workshop-create](http://files.software-carpentry.org/swc-workshop-create).

2.  Make sure that you are *not* inside another Git repository.

3.  Run the workshop website creation script with no parameters - it
    will print a help message telling you what parameters it needs.

    You need to use

    ~~~
    $ bash swc-workshop-create
    ~~~

    or change file mode with

    ~~~
    $ chmod +x swc-workshop-create
    ~~~

    before run the script by

    ~~~
    $ ./swc-workshop-create
    ~~~

4.  Run the script with those parameters.

5.  Go into your newly-created repository.

6.  Edit `index.html`.  Hints are embedded in the file, and full
    instructions are in [CUSTOMIZATION.md](CUSTOMIZATION.md).

7.  If you have installed the software described below:

    1.  Check your changes by running `tools/check.py` inside your
        repository.

    2.  Preview your changes by running `tools/preview` and looking at
        `_site/index.html`.

    3.  For some links work properly, **including the one to Eventbrite**, you
        will need to look at `_site/index.html` provide by a HTTP server that
        can be done using

        ~~~
        $ jekyll server -d _site
        ~~~

        and look at http://localhost:4000.

8.  Commit your changes and push to the `gh-pages` branch of your
    repository.

9.  Send the workshop coordinators the URL for your GitHub repository.

If the identifier for your workshop is `2015-07-01-esu`, and your
GitHub username is `ghopper`, your workshop repository will be
`https://github.com/ghopper/2015-07-01-esu` and the website for your
workshop will be `https://ghopper.github.io/2015-07-01-esu`.  (Note:
the workshop coordinators will want the former URL, not the latter.)

## Manual Setup

You can set up your repository manually instead of using the automated
`create` script.  Where you see <YOURUSERNAME> replace it with your 
github userID. The identifier for your workshop is the start date and 
the location of the workshop <YEAR-MONTH-DAY-LOCATION> e.g. 
'2015-01-07-ucdavis'. Where you see YEAR-MONTH-DAY-LOCATION, replace it
with the name of your workshop.

1.  Create an empty repository on GitHub called `YEAR-MONTH-DAY-LOCATION`. Do 
not initialize the repository with a README.

2.  Clone the template repository to your computer in a directory with
    the same name as your workshop identifier:

    ~~~
    $ git clone -b gh-pages -o upstream https://github.com/swcarpentry/workshop-template.git YEAR-MONTH-DAY-LOCATION
    ~~~

3.  Go into that directory using

    ~~~
    $ cd YEAR-MONTH-DAY-LOCATION
    ~~~

4.  Add your GitHub repository as a remote called `origin` using

    ~~~
    $ git remote add origin https://github.com/YOURUSERNAME/YEAR-MONTH-DAY-LOCATION.git
    ~~~

5.  Edit `index.html`.  Hints are embedded in the file, and full
    instructions are in [CUSTOMIZATION.md](CUSTOMIZATION.md).

6.  If you have installed the software described below:

    1.  Check your changes by running `tools/check.py` inside your
        repository.

    2.  Preview your changes by running `tools/preview` and looking at
        `_site/index.html`.

    3.  For some links work properly **including the one to Eventbrite** you
        will need to look at `_site/index.html` provide by a HTTP server that
        can be done using

        ~~~
        $ jekyll server -d _site
        ~~~

        and look at http://localhost:4000.

7.  Commit your changes and push to the `gh-pages` branch of your
    repository using

    ~~~
    $ git add index.html
    ~~~

    ~~~
    $ git commit -m "updated index.html with helpful information" 
    ~~~

8.  Manually add the other instructors as collaborators to your Github
    repository.

9.  Send the workshop coordinators the URL for your GitHub repository.

Note that SSH cloning (as opposed to the HTTPS cloning used above)
will also work for those who have set up SSH keys with GitHub.

## Previewing Changes Locally

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

## Final Steps

The final step in creating a website for your workshop is to customize
its home page by following [these instructions](CUSTOMIZATION.md).
This [FAQ](FAQ.md) includes a few extra tips --- additions are always
welcome --- and these notes on [the background and design](DESIGN.md)
of this template may help as well.

## Getting Help

Mail us at [admin@software-carpentry.org](mailto:admin@software-carpentry.org),
or join our [discussion list](http://lists.software-carpentry.org/mailman/listinfo/discuss_lists.software-carpentry.org)
and ask for help there.

## Giving Help

We are committed to offering a pleasant setup experience for our
learners and organizers.  If you find bugs in our instructions, or
would like to suggest improvements, please
[file an issue](https://github.com/swcarpentry/workshop-template/issues?q=is%3Aopen+is%3Aissue)
or [mail us](mailto:admin@software-carpentry.org).
