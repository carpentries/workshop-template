# Customizing Your Workshop's Website

## Configuration File

You must edit the `_config.yml` configuration file in the root directory of your workshop
and change the URLS called `workshop_repo` and `workshop_site`
to point to the repository for the lesson and its GitHub Pages site respectively.
If the URL for the repository is `https://github.com/gvwilson/2015-07-01-mistaktonic`,
the URL for the website will be `http://gvwilson.github.io/2015-07-01-miskatonic`.

You should not need to modify any of the other values in `_config.yml`.

## Home Page: Data

Your workshop's home page lives in `index.html`,
which must define the following values in its header:

*   `layout` must be `workshop`.

*   `root` must be the path to the repository's root directory.  This is
    '.' if the page is in the root directory (which `index.html` is).
    In other pages, `root` is '..' if the page is one directory down,
    '../..' if it is two levels down, and so on.

*   `venue` is the short name of the institution or group hosting the
    workshop, like "Euphoric State University".  It should *not*
    include the address or other details, since this value is 
    displayed in a table on the main
    [Software Carpentry](http://software-carpentry.org) website.

*   `address` is the workshop's address (including details like the
    room number). The address should be all on one line.

*   `country` must be a hyphenated title-cased country name like
    'United-States'.  This is used to look up flags for display in the
    main web site.

*   `language` is the language that will be used in the workshop.
    It must be a
    [ISO 639-1 code](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes).

*   `latlng` is the latitude and longitude of the workshop site (so we
    can put a pin on our map).  You can use
    [this site](http://itouchmap.com/latlong.html) to find these
    values.  You can *not* put spaces around the comma separating the
    latitude from the longitude.

*   `humandate` is the human-friendly dates for the workshop.  Please
    use three-letter month names and abbreviations (e.g., `Jul`
    instead of `July`), since these values are displayed in a table on
    the [Software Carpentry](http://software-carpentry.org) website.

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

*   `etherpad` is the URL for the Etherpad for your workshop.  If you are
    not using an Etherpad, you can delete this line.

* `eventbrite` is the multi-digit Eventbrite registration key.  If you
    are using Eventbrite, the Software Carpentry administraotrs will
    give this to you.  If you are using something else, you may delete
    this line.  Note: this value must be given as a string in double
    quotes, rather than as a number.

## Home Page: Schedule and Syllabus

You should edit the sections titled `Schedule` and `Syllabus`
so that they show what you're actually planning to teach and when.

## Home Page: Setup

You should delete the pieces of the `Setup` section
related to software you will not be using in your workshop,
so that learners don't spend time installing software they don't need.
After you edit the `Setup` section, you should edit the installation test script.

`swc-installation-test-1.py` is pretty simple, and just checks that
the students have a recent enough version of Python installed that
they can run `swc-installation-test-2.py`.

`swc-installation-test-2.py`
checks for a list of dependencies and prints error messages if a
package is not installed, or if the installed version is not current
enough.  By default, the script checks for pretty much anything that
has ever been used at a Software Carpentry workshop, which is probably
not what you want for your particular workshop.

Go through `swc-installation-test-2.py` and
comment any dependencies you don't need out of the `CHECKS` list.  You
might also want to skim through the minimum version numbers listed
where particular dependencies are defined (e.g. `('git', 'Git', (1, 7,
0), None)`).  For the most part, fairly conservative values have been
selected, so students with modern machines should be fine.  If your
workshop has stricter version requirements, feel free to bump them
accordingly.

Similarly, the virtual dependencies can be satisfied by any of several
packages.  If you don't want to support a particular package (e.g. if
you have no Emacs experience and don't want to be responsible for
students who show up with Emacs as their only editor), you can comment
out that particular `or_dependency`.
