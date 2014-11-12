# workshop-template

This repository is [Software Carpentry](http://software-carpentry.org)'s
template for creating websites for workshops.  Do *not* fork this
repository directly on GitHub.  Instead, follow the instructions below
to create a website repository for your workshop (and possibly a
second repository for your learners to use in your Git lessons).

### Dependencies

Jekyll 1.0.3 or later must be installed in order to preview the workshop
website locally on your computer.

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

**Warning: the website creation script mentioned below does not work properly yet.  Please follow the manual instructions below instead.**

1.  Download the workshop website creation script from
    [http://files.software-carpentry.org/create](http://files.software-carpentry.org/create).
    **Note:** this script has *not* been uploaded yet, since we're waiting for a few bugs to be fixed first.

2.  Make sure that you are *not* inside another Git repository.

3.  Run that script with no parameters - it will print a help message telling you what parameters it needs.

4.  Run the script with those parameters.

5.  Go into your newly-created repository.

6.  Edit `index.html`.  (Hints are embedded in the file, and full instructions are below.)

7.  Check your changes by running `tools/check` inside your repository.

8.  Preview your changes by running `tools/preview` and looking at `_site/index.html`.

9.  When it all looks good, commit your changes and push to the `gh-pages` branch of your repository.

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

2.  Clone it to your desktop using

    ~~~
    $ git clone https://github.com:/ghopper/2015-07-01-esu.git
    ~~~

    It's OK if you get the message
    `warning: You appear to have cloned an empty repository`.

3.  Go into that directory using

    ~~~
    $ cd 2015-07-01-esu
    ~~~

4.  Add this repository as a remote called `upstream` using

    ~~~
    $ git remote add upstream https://github.com:swcarpentry/workshop-template.git
    ~~~

5.  Checkout a branch called `gh-pages` using

    ~~~
    $ git checkout -b gh-pages
    ~~~

6.  Pull content from this repository using

    ~~~
    $ git pull upstream gh-pages
    ~~~

7.  Edit `index.html`. (Hints are embedded in the file, and full instructions
    are below.)

8.  Check your changes by running 

    ~~~
    $ tools/check
    ~~~

    inside your repository.

9.  Preview your changes by running

    ~~~
    $ tools/preview
    ~~~

    and looking at `_site/index.html`.

10. When it all looks good, commit your changes and push to the `gh-pages`
    branch of your repository.

11. Manually add the other instructors as collaborators to your Github
    repository.

12. Send the workshop coordinators the URL for your GitHub repository (*not* the
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
