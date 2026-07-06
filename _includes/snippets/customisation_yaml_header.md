{{"

##### Required variables

Your workshop's home page lives in `index.md`, which must define the values below in its header.
If your workshop is taught online, see the [online workshops section](#for-online-workshops) for customization options.

`layout`
: This **must** be `workshop`

`venue`
: The short name of the institution or group hosting the workshop, e.g. 'Euphoric State University'.
  It should *not* include the address or other details, since this value is displayed in a table on websites (e.g., <https://carpentries.org/upcoming_workshops/>).
  See section below for value to use for online workshops.

`address`
: The workshop's physical address (including details like the room number).
  The address should be all on one line.
  See section below for value to use for online workshops.

`country`
: This **must** be a two-letter ISO-3166 code for the country in which the workshop is going to take place, such as 'fr' (for France) or 'nz' (for New Zealand).
  See [ISO-3166 codes on Wikipedia](https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2#Officially_assigned_code_elements) for a complete list.
  See section below for value to use for online workshops.

`language`
: The language that will be used in the workshop.
  It must be an [ISO 639-1 code](https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes).
  Note that two-letter codes mean different things for countries and languages: 'ar' is Arabic when used for a language, but 'AR' is Argentina when used for a country.

`latitude` and `longitude`
: The latitude and longitude of the workshop site (so we can put a pin on our map).
  You can use [LatLong.net](https://www.latlong.net/) to find these values.
  See section below for value to use for online workshops.

`humandate`
: The human-friendly start and end date for the workshop.
  Please use three-letter month names and abbreviations, e.g. `Jul` instead of `July`).

`humantime`
: The human-friendly start and end time for each day of the workshop, e.g., '09:00 am - 4:00 pm' or '09:00-16:00'.

`startdate`
: The workshop's starting date in YYYY-MM-DD format, such as '2015-07-01'.
  You must use four digits for the year and two each for the month and day.

`enddate`
: The workshop's ending date in YYYY-MM-DD format, such as '2015-07-03'.
  **The `enddate` field should be deleted if:**
  * The duration of your workshop is only one day
  * Your workshop has a more complicated schedule (e.g., a half day a week for four weeks).

`instructor`
: A comma-separated list of instructor names.
  The list must be enclosed in square brackets, and each name must be in single quotes, e.g. `['Alan Turing','Grace Hopper']`.
  **Do not include other information (such as the word 'instructor') in these values.**

`helper`
: A comma-separated list of helper names formatted in the same way as the instructor names.
  If there are no helpers, use an empty list `[]`.

`contact`
: The contact email address to use for your workshop.
  If you do not provide a contact email address, your website will display the address for the workshop coordinators.

##### For online workshops

If the workshop is online, follow the same instructions as above with the following modifications:

`venue`
: Use the name of the institution that organizes the workshop.
  **Do not include a mention that it is an online workshop.**

`address`
: If you can safely share the URL for the videoconferencing, you may list it here.
  It **must** start with `http` or `https`.
  If you cannot, or prefer not to, share the videoconferencing information, use the value `online`.

`country`
: Please use the country associated with the host institution for the workshop.

`latitude` and `longitude`
: If possible, use the coordinates for the host institution. If not, use `0` for both the latitude and the longitude.

By default, the Setup Instructions will list the installation instructions for the videoconferencing service Zoom.
If you use a different videoconferencing service, you can edit the file in `_includes/install_instructions/videoconferencing.html` to include the relevant installation instructions.

##### Optional variables

The header may optionally define the following:

`collaborative_notes`
: The URL for the Etherpad for your workshop.
  If you are not using an Etherpad, you can delete this line.
  You can [create a carpentries etherpad here](https://pad.carpentries.org/).

`eventbrite`
: The multi-digit Eventbrite registration key **given as a string in double quotes, not as a number**.
  If you are using Eventbrite, the Carpentries Regional Coordinators will give this to you.
  If you are using something else, you may delete this line.

`what3words`
: The [what3words](https://what3words.com) address for the workshop venue.
  What3words divides the world into 3x3m squares and assigns each a unique address consisting of three words separated by dots, allowing users to specify locations precisely.
  Depending on the venue, this can be used to specify the location of e.g. the room or the building entrance.
  Note: this value is given in the form 'one.two.three' with no leading slashes and not as a URL.

" | markdownify }}