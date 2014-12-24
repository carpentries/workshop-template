#!/usr/bin/env python

'''Check that index.html is valid and print out warnings and errors
when the header is malformed.

Checks for:
1.  There should be the right number of categories
2.  Categories are allowed to appear only once
3.  Contact email should be valid (letters + @ + letters + . + letters)
4.  Latitute/longitude should be 2 floating point numbers separated by comma
5.  startdate should be a valid date; if enddate is present, it should be valid as well
6.  country should be a recognized hyphenated country name from the embedded list
7.  instructor and helper lists should be valid Python/Ruby lists
8.  Template header should not exist
9.  humandate should have three-letter month and four-letter year
10. layout should be 'workshop'
11. root must be '.'
12. humantime should have 'am' or 'pm' or both
13. address, venue should be non-empty
'''

import sys
import os
import re

import yaml
from collections import Counter

__version__ = '0.6'

EMAIL_PATTERN = r'[^@]+@[^@]+\.[^@]+'
HUMANTIME_PATTERN = r'((0?\d|1[0-1]):[0-5]\d(am|pm)(-|to)(0?\d|1[0-1]):[0-5]\d(am|pm))|((0?\d|1\d|2[0-3]):[0-5]\d(-|to)(0?\d|1\d|2[0-3]):[0-5]\d)'
EVENTBRITE_PATTERN = r'\d{9,10}'
URL_PATTERN = r'https?://.+'

DEFAULT_CONTACT_EMAIL = 'admin@software-carpentry.org'

USAGE = 'Usage: swc_index_validator.py [filename]'

ERROR = 'ERROR:\t{0}\n'
SUB_ERROR = '\t{0}\n'

COUNTRIES = [
    'Abkhazia', 'Afghanistan', 'Aland', 'Albania', 'Algeria',
    'American-Samoa', 'Andorra', 'Angola', 'Anguilla',
    'Antarctica', 'Antigua-and-Barbuda', 'Argentina', 'Armenia',
    'Aruba', 'Australia', 'Austria', 'Azerbaijan', 'Bahamas',
    'Bahrain', 'Bangladesh', 'Barbados', 'Basque-Country',
    'Belarus', 'Belgium', 'Belize', 'Benin', 'Bermuda', 'Bhutan',
    'Bolivia', 'Bosnia-and-Herzegovina', 'Botswana', 'Brazil',
    'British-Antarctic-Territory', 'British-Virgin-Islands',
    'Brunei', 'Bulgaria', 'Burkina-Faso', 'Burundi', 'Cambodia',
    'Cameroon', 'Canada', 'Canary-Islands', 'Cape-Verde',
    'Cayman-Islands', 'Central-African-Republic', 'Chad',
    'Chile', 'China', 'Christmas-Island',
    'Cocos-Keeling-Islands', 'Colombia', 'Commonwealth',
    'Comoros', 'Cook-Islands', 'Costa-Rica', 'Cote-dIvoire',
    'Croatia', 'Cuba', 'Curacao', 'Cyprus', 'Czech-Republic',
    'Democratic-Republic-of-the-Congo', 'Denmark', 'Djibouti',
    'Dominica', 'Dominican-Republic', 'East-Timor', 'Ecuador',
    'Egypt', 'El-Salvador', 'England', 'Equatorial-Guinea',
    'Eritrea', 'Estonia', 'Ethiopia', 'European-Union',
    'Falkland-Islands', 'Faroes', 'Fiji', 'Finland', 'France',
    'French-Polynesia', 'French-Southern-Territories', 'Gabon',
    'Gambia', 'Georgia', 'Germany', 'Ghana', 'Gibraltar',
    'GoSquared', 'Greece', 'Greenland', 'Grenada', 'Guam',
    'Guatemala', 'Guernsey', 'Guinea-Bissau', 'Guinea', 'Guyana',
    'Haiti', 'Honduras', 'Hong-Kong', 'Hungary', 'Iceland',
    'India', 'Indonesia', 'Iran', 'Iraq', 'Ireland',
    'Isle-of-Man', 'Israel', 'Italy', 'Jamaica', 'Japan',
    'Jersey', 'Jordan', 'Kazakhstan', 'Kenya', 'Kiribati',
    'Kosovo', 'Kuwait', 'Kyrgyzstan', 'Laos', 'Latvia',
    'Lebanon', 'Lesotho', 'Liberia', 'Libya', 'Liechtenstein',
    'Lithuania', 'Luxembourg', 'Macau', 'Macedonia',
    'Madagascar', 'Malawi', 'Malaysia', 'Maldives', 'Mali',
    'Malta', 'Mars', 'Marshall-Islands', 'Martinique',
    'Mauritania', 'Mauritius', 'Mayotte', 'Mexico', 'Micronesia',
    'Moldova', 'Monaco', 'Mongolia', 'Montenegro', 'Montserrat',
    'Morocco', 'Mozambique', 'Myanmar', 'NATO',
    'Nagorno-Karabakh', 'Namibia', 'Nauru', 'Nepal',
    'Netherlands-Antilles', 'Netherlands', 'New-Caledonia',
    'New-Zealand', 'Nicaragua', 'Niger', 'Nigeria', 'Niue',
    'Norfolk-Island', 'North-Korea', 'Northern-Cyprus',
    'Northern-Mariana-Islands', 'Norway', 'Olympics', 'Oman',
    'Pakistan', 'Palau', 'Palestine', 'Panama',
    'Papua-New-Guinea', 'Paraguay', 'Peru', 'Philippines',
    'Pitcairn-Islands', 'Poland', 'Portugal', 'Puerto-Rico',
    'Qatar', 'Red-Cross', 'Republic-of-the-Congo', 'Romania',
    'Russia', 'Rwanda', 'Saint-Barthelemy', 'Saint-Helena',
    'Saint-Kitts-and-Nevis', 'Saint-Lucia', 'Saint-Martin',
    'Saint-Vincent-and-the-Grenadines', 'Samoa', 'San-Marino',
    'Sao-Tome-and-Principe', 'Saudi-Arabia', 'Scotland',
    'Senegal', 'Serbia', 'Seychelles', 'Sierra-Leone',
    'Singapore', 'Slovakia', 'Slovenia', 'Solomon-Islands',
    'Somalia', 'Somaliland', 'South-Africa',
    'South-Georgia-and-the-South-Sandwich-Islands',
    'South-Korea', 'South-Ossetia', 'South-Sudan', 'Spain',
    'Sri-Lanka', 'Sudan', 'Suriname', 'Swaziland', 'Sweden',
    'Switzerland', 'Syria', 'Taiwan', 'Tajikistan', 'Tanzania',
    'Thailand', 'Togo', 'Tokelau', 'Tonga',
    'Trinidad-and-Tobago', 'Tunisia', 'Turkey', 'Turkmenistan',
    'Turks-and-Caicos-Islands', 'Tuvalu', 'US-Virgin-Islands',
    'Uganda', 'Ukraine', 'United-Arab-Emirates',
    'United-Kingdom', 'United-Nations', 'United-States',
    'Unknown', 'Uruguay', 'Uzbekistan', 'Vanuatu',
    'Vatican-City', 'Venezuela', 'Vietnam', 'Wales',
    'Wallis-And-Futuna', 'Western-Sahara', 'Yemen', 'Zambia',
    'Zimbabwe'
]

Error_Messages = [] # error messages

def look_for_fixme(func):
    '''Decorator to see whether a value starts with FIXME.'''
    def inner(arg):
        if (arg is not None) and arg.lstrip().startswith('FIXME'):
            return False
        return func(arg)
    return inner

@look_for_fixme
def check_layout(layout):
    '''Checks whether layout equals "workshop".'''
    return layout == 'workshop'

@look_for_fixme
def check_root(root):
    '''Checks root - can only be "."'''
    return root == '.'

@look_for_fixme
def check_country(country):
    '''A valid country is in the list of recognized countries.'''
    return country in COUNTRIES

@look_for_fixme
def check_humandate(date):
    '''A valid human date starts with a three-letter month and ends with four-letter year,
    Example: "Feb 18-20, 2525"
    other example: "Feb 18 and 20, 2014"
    '''
    if "," not in date:
        return False

    month_dates, year = date.split(",")

    # The first three characters of month_dates are not empty
    month = month_dates[:3]
    if any(char == " " for char in month):
        return False

    # But the fourth character is empty ("February" is illegal)
    if month_dates[3] != " ":
        return False

    # year contains *only* numbers
    try:
        int(year)
    except:
        return False

    return True

@look_for_fixme
def check_humantime(time):
    '''A valid humantime contains at least one number'''
    return bool(re.match(HUMANTIME_PATTERN, time.replace(" ","")))

def check_date(this_date):
    '''A valid date is YEAR-MONTH-DAY, example: 2014-06-30'''
    from datetime import date
    # yaml automatically loads valid dates as datetime.date
    return isinstance(this_date, date)

@look_for_fixme
def check_latitude_longitude(latlng):
    '''A valid latitude/longitude listing is two floats, separated by comma'''
    try:
        lat, lng = latlng.split(',')
        lat = float(lat)
        long = float(lng)
    except ValueError:
        return False
    return (-90.0 <= lat <= 90.0) and (-180.0 <= long <= 180.0)

def check_instructors(instructors):
    '''Checks whether instructor list is of format ['First name', 'Second name', ...']'''
    # yaml automatically loads list-like strings as lists
    return isinstance(instructors, list) and len(instructors) > 0

def check_helpers(helpers):
    '''Checks whether helpers list is of format ['First name', 'Second name', ...']'''
    # yaml automatically loads list-like strings as lists
    return isinstance(helpers, list) and len(helpers) >= 0

@look_for_fixme
def check_email(email):
    '''A valid email has letters, then an @, followed by letters, followed by a dot, followed by letters.'''
    return bool(re.match(EMAIL_PATTERN, email)) and email != DEFAULT_CONTACT_EMAIL

@look_for_fixme
def check_eventbrite(eventbrite):
    '''A valid EventBrite key is 9 or more digits.'''
    return bool(re.match(EVENTBRITE_PATTERN, eventbrite))

@look_for_fixme
def check_etherpad(etherpad):
    '''A valid Etherpad URL is just a URL.'''
    return bool(re.match(URL_PATTERN, etherpad))

@look_for_fixme
def check_pass(value):
    '''A test that always passes, used for things like addresses.'''
    return True

HANDLERS = {
    'layout' :       (True,  check_layout, 'layout isn\'t "workshop".'),
    'root' :         (True,  check_root, 'root can only be ".".'), 
    'country' :      (True,  check_country, 'country invalid: must use full hyphenated name from: ' + ' '.join(COUNTRIES)),
    'humandate' :    (True,  check_humandate, 'humandate invalid. Please use three-letter months like "Jan" and four-letter years like "2025".'),
    'humantime' :    (True,  check_humantime, 'humantime doesn\'t include numbers.'),
    'startdate' :    (True,  check_date, 'startdate invalid. Must be of format year-month-day, i.e., 2014-01-31.'),
    'enddate' :      (False, check_date, 'enddate invalid. Must be of format year-month-day, i.e., 2014-01-31.'),
    'latlng' :       (True,  check_latitude_longitude, 'latlng invalid. Check that it is two floating point numbers, separated by a comma.'),
    'instructor' :   (True,  check_instructors, 'instructor list isn\'t a valid list of format ["First instructor", "Second instructor",..].'),
    'helper' :       (True,  check_helpers, 'helper list isn\'t a valid list of format ["First helper", "Second helper",..].'),
    'contact' :      (True,  check_email, 'contact email invalid or still set to "{0}".'.format(DEFAULT_CONTACT_EMAIL)),
    'eventbrite' :   (False, check_eventbrite, 'Eventbrite key appears invalid.'),
    'etherpad' :     (False, check_etherpad, 'Etherpad URL appears invalid.'),
    'venue' :        (False, check_pass, 'venue name not specified'),
    'address' :      (False, check_pass, 'address not specified')
}

# REQUIRED is all required categories.
REQUIRED = set([k for k in HANDLERS if HANDLERS[k][0]])

# OPTIONAL is all optional categories.
OPTIONAL = set([k for k in HANDLERS if not HANDLERS[k][0]])

def check_validity(data, function, error):
    '''Wrapper-function around the various check-functions.'''
    valid = function(data)
    if not valid:
        Error_Messages.append(ERROR.format(error))
        Error_Messages.append(SUB_ERROR.format('Offending entry is: "{0}"'.format(data)))
    return valid

def check_categories(left, right, message):
    result = left - right
    if result:
        Error_Messages.append(ERROR.format(message))
        Error_Messages.append(SUB_ERROR.format('Offending entries: {0}'.format(result)))
        return False
    return True

def check_double_categories(seen_categories, message):
    category_counts = Counter(seen_categories)
    double_categories = [category for category in category_counts if category_counts[category] > 1]
    if double_categories:
        Error_Messages.append(ERROR.format(message))
        Error_Messages.append(SUB_ERROR.format('"{0}" appears more than once.\n'.format(double_categories)))
        return False
    return True

def get_header(lines):
    '''Parses list of lines, returning just the header.'''
    # We stop the header once we see the second '---'
    delimiters = 0
    header = []
    categories = []
    for line in lines:
        line = line.rstrip()
        if line == '---':
            delimiters += 1
            if delimiters == 2:
                break
        else:
            # Work around PyYAML Ticket #114
            if not line.startswith('#'):
                header.append(line)
                categories.append(line.split(":")[0].strip())

    valid = (delimiters == 2)
    return valid, yaml.load("\n".join(header)), categories

def check_file(filename, data):
    '''Gets header from index.html, calls all other functions and checks file for validity.
    Returns True when 'index.html' has no problems and False when there are problems.
    '''
    global Error_Messages

    Error_Messages = []
    lines = data.split('\n')
    valid, header_data, seen_categories = get_header(lines)

    if not valid:
        msg = 'Cannot find header in given file "{0}". Please check path, is this the bc index.html?\n'.format(filename)
        Error_Messages.append(ERROR.format(msg))
        return False

    # Look through all header entries.  If the category is in the input
    # file and is either required or we have actual data (as opposed to
    # a commented-out entry), we check it.  If it *isn't* in the header
    # but is required, report an error.
    is_valid = True
    for category in HANDLERS:
        required, handler_function, error_message = HANDLERS[category]
        if category in header_data:
            if required or header_data[category]:
                is_valid &= check_validity(header_data[category], handler_function, error_message)
        elif required:
            Error_Messages.append(ERROR.format('index file is missing mandatory key "{0}".'.format(category)))
            is_valid &= False

    # Do we have double categories?
    is_valid &= check_double_categories(seen_categories, 'There are categories appearing twice or more.')

    # Check whether we have missing or too many categories
    seen_categories = set(seen_categories)
    is_valid &= check_categories(REQUIRED, seen_categories, 'There are missing categories.')
    is_valid &= check_categories(seen_categories, REQUIRED.union(OPTIONAL), 'There are superfluous categories.')

    return is_valid, Error_Messages

def main():
    '''Run as the main program.'''
    filename = None
    if len(sys.argv) == 1:
        if os.path.exists('./index.html'):
            filename = './index.html'
        elif os.path.exists('../index.html'):
            filename = '../index.html'
    elif len(sys.argv) == 2:
        filename = sys.argv[1]
    if filename is None:
        sys.stderr.write('Usage: "python check" or "python check path/to/index.html"\n')
        sys.exit(1)

    sys.stderr.write('Testing "{0}".\n'.format(filename))

    with open(filename) as reader:
        data = reader.read()
        is_valid, error_messages = check_file(filename, data)

    if is_valid:
        sys.stderr.write('Everything seems to be in order.\n')
        sys.exit(0)
    else:
        for m in error_messages:
            sys.stderr.write(m)
        sys.exit(1)

if __name__ == '__main__':
    main()
