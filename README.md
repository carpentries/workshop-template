# workshop-template

This repository is [Software Carpentry](http://software-carpentry.org)'s 
template for creating workshop websites.


## Installation

**Alert:** 
Do *not* fork `workshop-template` directly on GitHub. Follow the
instructions below to create *two* new repositories for your event's
workshop.

### Dependencies *(Check before proceeding)*

Jekyll 1.0.3 or later must be installed in order to preview the workshop
website locally on your computer. 

1. Check if you have Ruby installed on your computer (`ruby -v` from the
command line).

2. Install `github-pages`:

    ~~~
    $ gem install github-pages
    ~~~

    or if that doesn't work:

    ~~~
    $ gem install jekyll
    $ gem install kramdown
    ~~~

    (Kramdown is used for translating Markdown, instead of the default
    Redcarpet, since Kramdown handles Markdown inside HTML blocks.)

### Structure *(Why use two repos for your workshop?)*

You should, especially if you will be teaching Git, create *two* new
repositories:

  1.  repository for your workshop's website

  2.  repository for learners to clone and update during your lessons 

You should not try to use the same repo for both purposes because:

  *  your workshop website repository contains many files that
     most learners don't need to see during the lesson, and

  *  you probably don't want to accidentally merge a damaging pull
     request from a novice Git user into your workshop's website
     while you are using it to teach.
          
### Installation *(Easy, automated method)*

**Warning: the website creation script mentioned below does not work properly yet.  Please follow the "Manual, do it yourself" instructions instead.**

1.  Download the workshop website creation script from [http://files.software-carpentry.org/create](http://files.software-carpentry.org/create).  **Note:** this script has *not* been uploaded yet, since we're waiting for a few bugs to be fixed first.
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

### Installation *(Manual, do it yourself method)*

You can set up your repository manually instead of using the automated
`create` script.  As above, we will assume that your user ID is `ghopper` and
the identifier for your workshop is `2015-07-01-esu`.

1.  Create an empty repository on GitHub called `2015-07-01-esu`.
2.  Clone it to your desktop using

    ~~~
    $ git clone git@github.com:/ghopper/2015-07-01-esu
    ~~~

    It's OK if get `warning: You appear to have cloned an empty repository`.
3.  Go into that directory using

    ~~~
    $ cd 2015-07-01-esu
    ~~~
4.  Add this repository as a remote called `upstream` using

    ~~~
    $ git remote add upstream git@github.com:swcarpentry/workshop-template
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


## Customizing your workshop repositories

Please see instructions on [customizing your workshop repositories](CUSTOMIZATION.md)
for information about:

* Background on terminology and our approach

* Setting Variables to customize your workshop


## FAQ

[Read the FAQ for more detailed help.](FAQ.md)


## Getting help

Mail us at [admin@software-carpentry.org](mailto:admin@software-carpentry.org),
or join our [discussion list](http://lists.software-carpentry.org/mailman/listinfo/discuss_lists.software-carpentry.org)
and ask for help there.


## Report problems or suggest improvements

Please file issues on this template
[here](https://github.com/swcarpentry/workshop-template)
or [mail us](mailto:admin@software-carpentry.org).

