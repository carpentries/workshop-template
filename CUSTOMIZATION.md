# Customizing Your Workshop's Website

You must change the values of `lesson_repo` and `lesson_site` in
the `_config.yml` configuration file in the root directory of your
workshop to point to the repository for the lesson and its GitHub
pages URL respectively.  You should not need to modify any of the
other values in `_config.yml`.

Your workshop's `index.html` page must define the following values
in its header:

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
    room number.

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

*   `eventbrite` is the multi-digit Eventbrite registration key.  If you
    are using Eventbrite, the admins will set this key for you.  If
    you are using something else for registration, it may be deleted.
    Note: this value must be given as a string in double quotes, rather
    than as a number.

*   `etherpad` is the URL for the Etherpad for your workshop.  If you are
    not using an Etherpad, you can delete this value.
