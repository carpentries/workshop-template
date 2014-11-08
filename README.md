# workshop-template

This repository is the template for
[Software Carpentry](http://software-carpentry.org) workshop websites.
Do *not* fork it directly on GitHub to create a website for your
workshop; instead, follow the instructions below.

**Note:**

1.  If you are teaching Git in your workshop, you should create *two*
    repositories: one for your workshop's website, and one for
    learners to clone and update during your lessons.  You should not
    try to use the same repo for both purposes because:

    1.  your workshop website probably contains a lot of files that
        most learners don't need to see during the lesson, and

    2.  you probably don't want to accidentally merge a damaging pull
        request from a novice Git user into your workshop's website
        while you are using it to teach.

2.  You will need to install Jekyll 1.0.3 or later in order to preview
    things locally.  If you have Ruby installed on your computer, this
    *should* be as simple as:

    ~~~
    $ gem install github-pages
    ~~~

    or if that doesn't work:

    ~~~
    $ gem install jekyll
    $ gem install kramdown
    ~~~

    (We use Kramdown for translating Markdown instead of the default
    Redcarpet because Kramdown will handle Markdown inside HTML
    blocks).

## Summary

1. Download the workshop website creation script from [http://files.software-carpentry.org/create](http://files.software-carpentry.org/create).
2. Make sure that you are *not* inside another Git repository.
3. Run that script with no parameters - it will print a help message telling you what parameters it needs.
4. Run the script with those parameters.
5. Go into your newly-created repository.
6. Edit `index.html`.  (Hints are embedded in the file, and full instructions are below.)
7. Check your changes by running `tools/check` inside your repository.
8. Preview your changes by running `tools/preview` and looking at `_site/index.html`.
9. When it all looks good, commit your changes and push to the `gh-pages` branch of your repository.
10. Send the workshop coordinators the URL for your GitHub repository (*not* the URL for the workshop website).

If the identifier for your workshop is `2015-07-01-esu`, and your
GitHub username is `ghopper`, your workshop repository will be
`https://github.com/ghopper/2015-07-01-esu` and the website for your
workshop will be `https://ghopper.github.io/2015-07-01-esu`.

## If You Want To Do Things By Hand

You can set up your repository manually instead of using the `create`
script.  As above, we will assume that your user ID is `ghopper` and
the identifier for your workshop is `2015-07-01-esu`.

1. Create an empty repository on GitHub called `2015-07-01-esu`.
2. Clone it to your desktop using `git clone git@github.com:/ghopper/2015-07-01-esu`.
3. Go into that directory using `cd 2015-07-01-esu`.
4. Add this repository as a remote called `upstream`using `git remote add upstream git@github.com:swcarpentry/workshop-template`.
5. Checkout a branch called `gh-pages` using `git checkout -b gh-pages`.
6. Pull content from this repository using `git pull upstream gh-pages`.
7. Edit `index.html`.  (Hints are embedded in the file, and full instructions are below.)
8. Check your changes by running `tools/check` inside your repository.
9. Preview your changes by running `tools/preview` and looking at `_site/index.html`.
10. When it all looks good, commit your changes and push to the `gh-pages` branch of your repository.
11. Manually add the other instructors as collaborators.
12. Send the workshop coordinators the URL for your GitHub repository (*not* the URL for the workshop website).

## Background

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
    GitHub doesn't allow that, we've had to find a workaround.

3.  If a repository has a file called `README.md` in its root
    directory, GitHub displays that file on the repository's home
    page.

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
    runs the file through a translator called
    [Jekyll](https://en.wikipedia.org/wiki/Jekyll_%28software%29) that
    looks for specially-formatted commands embedded in the file and uses
    them to fill in the page.

6.  Commands can be embedded in the body of a page.  One is
    {% raw %}{% include something.html %}{% endraw %}, which tells
    Jekyll to copy the contents of `something.html` into the file
    being translated; this is used to create standard headers and
    footers for pages.  Another is `{{variable}}`: when Jekyll sees
    this, it replaces it with the value of `variable`.  This is used
    to insert things like a contact email address and the URL for our
    Twitter account.

7.  Jekyll gets variables from two places: a file called `_config.yml`
    located in the repo's root directory, and the header of each
    individual page.  Variables from `_config.yml` are put in an
    object called `site`, and referred to as `site.variable`, so
    `{{site.twitter_name}}` in a page is replaced by `@swcarpentry`.
    Variables from the page's header are put in an object called
    `page`, and referred to as `page.variable`, so if a page's header
    defines a variable called `venue`, `{{page.venue}}` is replaced by
    "Euphoric State University" (or whatever value the variable has).

8.  If a page uses {% raw %}{% include something.html %}{% endraw %}
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

*   `workshop.html` is used for workshops' home pages, and is the layout
    for the `index.html` page in your repo's root directory.  That
    `index.html` page's header must
    [define several variables](#variables) in order for your workshop
    to be included in our main website.

*   `page.html` is used for any other pages you want to create.

## Variables

Your workshop's `index.html` page *must* define the following values
in its header:

*   `layout` must be `workshop`.

*   `root` must the path to the repository's root directory.  This is
    '.' if the page is in the root directory (which `index.html` is).
    In other pages, `root` is '..' if the page is one directory down,
    '../..' if it is two levels down, and so on.

*   `venue` is the short name of the institution or group hosting the
    workshop, like "Euphoric State University".  It should *not*
    include the address or other details, since this value is 
    displayed in a table on the main
    [Software Carpentry](http://software-carpentry.org) website.

*   `address` is the workshop's address (including details like the
    room number.

*   `country` must be a hyphenated title-cased country name like
    'United-States'.  This is used to look up flags for display in the
    main web site.

*   `latlng` is the latitude and longitude of the workshop site (so we
    can put a pin on our map).  You can use
    [this site](http://itouchmap.com/latlong.html) to find these
    values.  You can *not* put spaces around the comma separating the
    latitude from the longitude.

*   `humandate` is the human-friendly dates for the workshop (e.g.,
    `Jul 3-4, 2015`).  Please use three- or four-letter month names
    and abbreviations (e.g., `Dec` instead of `December`), since these
    values are displayed in a table on the
    [Software Carpentry](http://software-carpentry.org) website.

*   `startdate` is the workshop's starting date in YYYY-MM-DD format,
    such as `2015-07-01`.  You must use four digits for the year and
    two each for the month and day.

*   `enddate` is the workshop's ending date in the same format.  If your
    workshop is only one day long, the `enddate` field should be deleted.
    If your workshop has a more complicated schedule (e.g., a half day a
    week for four weeks), please delete the `enddate` field and only tell
    us its start date.

*   `instructor` is a comma-separated list of instructor names.  The
    list must be enclosed in square brackets, and each name must be in
    double quotes, as in `["Alan Turing","Grace Hopper"]`.  Do not
    include other information (such as the word "instructor") in these
    values.

*   `helper` is a comma-separated list of helper names formatted in the
    same way as the instructor names.  If there are no helpers, use an
    empty list `[]`.

*   `contact` is the contact email address to use for your workshop.
    If you do not provide a contact email address, your website will
    display the address for the workshop coordinators (who probably
    won't be able to answer questions about the specific details of
    your workshop).

The header may optionally define the following:

*   `eventbrite` is the multi-digit Eventbrite registration key.  If you
    are using Eventbrite, the admins will set this key for you.  If
    you are using something else for registration, it may be deleted.
    Note: this value must be given as a string in double quotes, rather
    than as a number.

*   `etherpad` is the URL for the Etherpad for your workshop.  If you are
    not using an Etherpad, you can delete this value.

## FAQ

*   *Where can I get help?*

    Mail us at [admin@software-carpentry.org](mailto:admin@software-carpentry.org),
    or join our [discussion list](http://lists.software-carpentry.org/mailman/listinfo/discuss_lists.software-carpentry.org)
    and ask for help there.

*   *Where can I report problems or suggest improvements?*

    Please file an issue against [https://github.com/swcarpentry/workshop-template](this repository)
    or [mail us](mailto:admin@software-carpentry.org).

*   *Why does the workshop repository have to be created from scratch? Why not fork `workshop-template` on GitHub?*

    Because any particular user can only have one fork of a repository,
    but instructors frequently need to work on several workshops at once.

*   *Why use Jekyll?  Why not some other markup language and some other converter?*

    Because it's the default on GitHub.  If we're going to teach
    people to use that site, we should teach them to use it as it is,
    not as we wish it was.

*   *What do I do if I see a `invalid byte sequence in ...` error when I run `tools/check`?*

    Declare the `en_US.UTF-8` locale in your shell:

    ~~~
    $ export LC_ALL=en_US.UTF-8
    $ export LANG=en_US.UTF-8
    ~~~

*   *What do I do if I see a `Conversion error` when I run `tools/check`?*

    The error message may look something like this:

    ~~~
    Configuration file: d:/OpenCourses/swc/2013-10-17-round6.4/_config.yml
            Source: d:/OpenCourses/swc/2013-10-17-round6.4
       Destination: _site
      Generating... c:/Ruby193/lib/ruby/gems/1.9.1/gems/posix-spawn-0.3.6/lib/posix/spawn.rb:162: wa
    rning: cannot close fd before spawn
    Conversion error: There was an error converting 'lessons/misc-biopython/fastq.md'.
    done.
    ~~~
        
    This is a [problem in Pygments.rb](http://stackoverflow.com/questions/17364028/jekyll-on-windows-pygments-not-working).
    Uninstall pygments.rb 0.5.1 or 0.5.2, install 0.5.0.  For example, here's how you would
    uninstall pygments 0.5.2 and restore version 0.5.0:

    ~~~
    $ gem uninstall pygments.rb --version "=0.5.2"
    $ gem install pygments.rb --version "=0.5.0"
    ~~~

*   *Where should pages go if multiple workshops are running at a site simultaneously?*

    Use subdirectories like `2015-07-01-esu/beginners`, so that main
    directory names always follow our four-part convention.

*   *What if I want to add more values to the page, like `address1` and `address2` for different rooms on different days?*

    Go ahead, but you *must* have 
    [the variables described above](#variables).

*   *What is the "Windows installer"?*

    We have built a small installation helper for Windows that
    installs `nano` and `sqlite`, adds R to the path, and so on.  It
    is maintained in
    [https://github.com/swcarpentry/windows-installer](https://github.com/swcarpentry/windows-installer),
    which also has an up-to-date description of what it actually does.
    The latest version is always available at
    [http://files.software-carpentry.org/SWCarpentryInstaller.exe](http://files.software-carpentry.org/SWCarpentryInstaller.exe),
    and contributions are always welcome.
