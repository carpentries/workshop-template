# workshop-template

This repository is [Software Carpentry](http://software-carpentry.org)'s
template for creating websites for workshops.  Do *not* fork this
repository directly on GitHub.  Instead, follow the instructions below
to create a website repository for your workshop (and possibly a
second repository for your learners to use in your Git lessons).

### Dependencies

*Note that these dependencies are not critical to creating a workshop
website. If you aren't able to install them successfully (and/or you just
can't be bothered), all that means is you won't be able to preview
the website locally on your computer. Every time you push a change to your
website respository the live website will update automatically, so you can
simply check your changes on the live site instead.*  

In order to preview the workshop website locally on your computer,
Jekyll 1.0.3 or later must be installed.

1.  Check that you have Ruby installed on your computer (`ruby -v`
    from the command line).

2. Install `github-pages`:

    ~~~
    $ gem install github-pages
    ~~~

    or if that doesn't work:

    ~~~
    $ gem install jekyll
    $ gem install kramdown
    ~~~

    We use Kramdown to translate Markdown into HTML, instead of the
    default Redcarpet, because Kramdown handles Markdown inside HTML
    blocks.

3.  Install the Python YAML module.  If you are using the Anaconda
    Python distribution, you probably already have it; if you don't,
    you can install it with:

    ~~~
    $ conda install pyyaml
    ~~~

    If you are using some other distribution, you can install it using
    Pip:

    ~~~
    $ pip install pyyaml
    ~~~

    and if you are on Debian Linux, you can use:

    ~~~
    $ apt-get install python-yaml
    ~~~

### One Repository or Two?

If you are teaching Git, you should create a separate repository for
learners to use in that lesson.  You should not have them use the
workshop website repository because:

*   your workshop website repository contains many files that
    most learners don't need to see during the lesson, and

*   you probably don't want to accidentally merge a damaging pull
    request from a novice Git user into your workshop's website while
    you are using it to teach.

### Semi-Automated Installation

1.  Download the workshop website creation script from
    [http://files.software-carpentry.org/workshop-create](http://files.software-carpentry.org/workshop-create).

2.  Make sure that you are *not* inside another Git repository.

3.  Run that script with no parameters - it will print a help message telling you what parameters it needs.

4.  Run the script with those parameters.

5.  Go into your newly-created repository.

6.  Edit `index.html`.  (Hints are embedded in the file, and full instructions are below.)

7.  [If you installed the dependencies...] Check your changes by running `tools/check.py` 
    inside your repository.

8.  [If you installed the dependencies...] Preview your changes by running `tools/preview` 
    and looking at `_site/index.html`.

9.  When it all looks good (or if you didn't install the dependencies for checking and previewing locally), commit your changes and push to the `gh-pages` branch of your repository.

10. Send the workshop coordinators the URL for your GitHub repository (*not* the URL for the workshop website).

If the identifier for your workshop is `2015-07-01-esu`, and your
GitHub username is `ghopper`, your workshop repository will be
`https://github.com/ghopper/2015-07-01-esu` and the website for your
workshop will be `https://ghopper.github.io/2015-07-01-esu`.

### Manual Installation

You can set up your repository manually instead of using the automated
`create` script.  As above, we will assume that your user ID is `ghopper` and
the identifier for your workshop is `2015-07-01-esu`.

1.  Create an empty repository on GitHub called `2015-07-01-esu`.

2.  Clone the template repository to your computer in a directory with the same
    name as your workshop identifier:

    ~~~
    $ git clone -b gh-pages -o upstream https://github.com/swcarpentry/workshop-template.git 2015-07-01-esu
    ~~~

3.  Go into that directory using

    ~~~
    $ cd 2015-07-01-esu
    ~~~

4.  Add your GitHub repository as a remote called `origin` using

    ~~~
    $ git remote add origin https://github.com/ghopper/2015-07-01-esu.git
    ~~~

5.  Edit `index.html`. (Hints are embedded in the file, and full instructions
    are below.)

6.  [If you installed the dependencies...] Check your changes by running

    ~~~
    $ tools/check.py
    ~~~

    inside your repository.

7.  [If you installed the dependencies...] Preview your changes by running

    ~~~
    $ tools/preview
    ~~~

    and looking at `_site/index.html`.

8.  When it all looks good (or if you didn't install the dependencies 
    for checking and previewing locally),commit your changes and push 
    to the `gh-pages` branch of your repository.

9.  Manually add the other instructors as collaborators to your Github
    repository.

10. Send the workshop coordinators the URL for your GitHub repository (*not* the
    URL for the workshop website).

Note that SSH cloning (as opposed to the HTTPS cloning used above)
will also work for those who are familiar with how to set up SSH keys
with GitHub.

## For More Information

Please see the following for more information on:

*   [customizing your workshop's home page](CUSTOMIZATION.md)
*   [background and design](DESIGN.md)
*   [FAQ](FAQ.md)

## Getting Help

Mail us at [admin@software-carpentry.org](mailto:admin@software-carpentry.org),
or join our [discussion list](http://lists.software-carpentry.org/mailman/listinfo/discuss_lists.software-carpentry.org)
and ask for help there.

If you find bugs or would like to suggest improvements,
please file an issue [here](https://github.com/swcarpentry/workshop-template)
or [mail us](mailto:admin@software-carpentry.org).
