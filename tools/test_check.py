#!/usr/bin/env python

"""Test suite for index page checking script."""

from io import StringIO
from datetime import date
import check

def test_check_layout():
    assert check.check_layout("workshop")

def test_check_layout_fail():
    assert not check.check_layout("lesson")

def test_check_root():
    assert check.check_root(".")

def test_check_root_fail():
    assert not check.check_root("setup")

def test_check_country_none():
    assert not check.check_country(None)

def test_check_country_two_words():
    assert not check.check_country("Some Country")

def test_check_country_abbrev():
    assert not check.check_country("USA")

def test_check_country_correct_unhyphenated():
    assert check.check_country("Canada")

def test_check_country_correct_hyphenated():
    assert check.check_country("United-Kingdom")

def test_check_language_none():
    assert not check.check_layout(None)

def test_check_language_name():
    assert not check.check_layout('english')

def test_check_language_upper_name():
    assert not check.check_layout('English')

def test_check_language_correct():
    assert check.check_language('en')

def test_check_non_language_correct():
    assert not check.check_language('xx')

def test_check_humandate():
    assert check.check_humandate("Feb 18-20, 2525")

def test_check_humandate_fail():
    assert not check.check_humandate("February 18-20, 2525")

def test_check_humandate_chars():
    assert not check.check_humandate("XXX SomeDay, Year")

def test_check_humantime():
    assert not check.check_humantime("09:00am")

def test_check_euro_humantime():
    assert check.check_humantime("09:00-17:00")

def test_check_humantime_fail():
    assert not check.check_humantime("09:00")

def test_check_humantime_only_am():
    assert not check.check_humantime("am")

def test_check_humantime_without_spaces():
    assert check.check_humantime("9:00am-5:00pm")

def test_check_humantime_with_spaces():
    assert check.check_humantime("9:00am - 5:00pm")

def test_check_humantime_with_extra_spaces():
    assert check.check_humantime("9:00 am - 5:00 pm")

def test_check_humantime_with_to():
    assert check.check_humantime("9:00am to 5:00pm")

def test_check_humantime_with_to_and_spaces():
    assert check.check_humantime("9:00 am to 5:00 pm")

def test_check_humantime_without_am_pm():
    assert check.check_humantime("9:00-17:00")

def test_check_humantime_without_am_pm_with_to():
    assert check.check_humantime("9:00 to 17:00")

def test_check_date():
    assert check.check_date(date(2525, 2, 20))

def test_check_date_fail():
    assert not check.check_date("Feb 18-20, 2525")

def test_check_latitude_longitude():
    assert check.check_latitude_longitude("0.0,0.0")

def test_check_latitude_longitude_chars():
    assert not check.check_latitude_longitude("foo,bar")

def test_check_instructors():
    assert check.check_instructors(["John Doe", "Jane Doe"])

def test_check_instructor_only_one():
    assert check.check_instructors(["John Doe"])

def test_check_instructor_empty():
    assert not check.check_instructors([])

def test_check_instructor_string():
    assert not check.check_instructors("John Doe")

def test_check_helpers():
    assert check.check_helpers(["John Doe", "Jane Doe"])

def test_check_helpers_only_one():
    assert check.check_helpers(["John Doe"])

def test_check_helpers_empty():
    assert check.check_helpers([])

def test_check_helper_string():
    assert not check.check_helpers("John Doe")

def test_check_email():
    assert check.check_email("user@box.com")

def test_check_email_obfuscate():
    assert not check.check_email("user AT box DOT com")

def test_check_email_not_default():
    assert not check.check_email('admin@software-carpentry.org')

def test_check_eventbrite_9_digits():
    assert check.check_eventbrite('1' * 9)

def test_check_eventbrite_10_digits():
    assert check.check_eventbrite('1' * 10)

def test_check_not_eventbrite_8_digits():
    assert not check.check_eventbrite('1' * 8)

def test_check_not_eventbrite_empty():
    assert not check.check_eventbrite('')

def test_check_not_eventbrite_non_digits():
    assert not check.check_eventbrite('1' * 8 + 'a')

def test_check_with_enddate():
    header = """---
layout: workshop
root: .
venue: Euphoric State University
address: 123 College Street, Euphoria
country: United-States
humandate: Feb 17-18, 2020
humantime: 9:00 am - 4:30 pm
startdate: 2020-06-17
enddate: 2020-06-18
latlng: 41.7901128,-87.6007318
instructor: ["Grace Hopper", "Alan Turing"]
helper: [ ]
contact: alan@turing.com
---"""

    assert check.check_file('test.html', header) == []

def test_check_without_enddate():
    header = """---
layout: workshop
root: .
venue: Euphoric State University
address: 123 College Street, Euphoria
country: United-States
humandate: Feb 17-18, 2020
humantime: 9:00 am - 4:30 pm
startdate: 2020-06-17
latlng: 41.7901128,-87.6007318
instructor: ["Grace Hopper", "Alan Turing"]
contact: alan@turing.com
helper: [ "John von Neumann" ]
---"""

    assert check.check_file('test.html', header) == []

def test_check_with_blank_lines():
    header = """---
layout: workshop

root: .

venue: Euphoric State University
address: 123 College Street, Euphoria
country: United-States
humandate: Feb 17-18, 2020
humantime: 9:00 am - 4:30 pm
startdate: 2020-06-17
enddate: 2020-06-18
latlng: 41.7901128,-87.6007318
instructor: ["Grace Hopper", "Alan Turing"]
helper: [ ]
contact: alan@turing.com
---"""

    assert check.check_file('test.html', header) != []

def test_check_with_commented_lines():
    header = """---
layout: workshop
root: .
venue: Euphoric State University
address: 123 College Street, Euphoria
country: United-States
humandate: Feb 17-18, 2020
humantime: 9:00 am - 4:30 pm
startdate: 2020-06-17
enddate: 2020-06-18
latlng: 41.7901128,-87.6007318
instructor: ["Grace Hopper", "Alan Turing"]
helper: [ ]
contact: alan@turing.com
# eventbrite:
---"""

    assert check.check_file('test.html', header) == []

def test_check_with_commented_values():
    header = """---
layout: workshop
root: .
venue: Euphoric State University
address: 123 College Street, Euphoria
country: United-States
humandate: Feb 17-18, 2020
humantime: 9:00 am - 4:30 pm
startdate: 2020-06-17
enddate: 2020-06-18
latlng: 41.7901128,-87.6007318
instructor: ["Grace Hopper", "Alan Turing"]
helper: [ ]
contact: alan@turing.com
eventbrite: # FIXME
---"""

    assert check.check_file('test.html', header) == []

def test_check_with_leading_blank_lines():
    header = """
---
layout: workshop
root: .
venue: Euphoric State University
address: 123 College Street, Euphoria
country: United-States
humandate: Feb 17-18, 2020
humantime: 9:00 am - 4:30 pm
startdate: 2020-06-17
enddate: 2020-06-18
latlng: 41.7901128,-87.6007318
instructor: ["Grace Hopper", "Alan Turing"]
helper: [ ]
contact: alan@turing.com
eventbrite: # FIXME
---"""

    assert check.check_file('test.html', header) != []

def test_check_with_missing_yaml_terminator():
    header = """
---
layout: workshop
root: .
<!--
  Edit the values in the block above to be appropriate for your
  workshop.  Run 'tools/check' *before* committing to make sure that
  changes are good.
-->
"""

    assert check.check_file('test.html', header) != []
