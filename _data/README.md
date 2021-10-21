# data.csv

The file `data.csv` in this directory contains the workshop information:

- venue: brief name of the institution that hosts the workshop without address
(e.g., "eScience Center")

- address: full street address of workshop (e.g., "Science Park 140, 1098 XG
  Amsterdam")

- country: country for the institution that hosts the workshop (e.g.,
  Netherlands)

- latitude: decimal latitude of workshop venue, use https://www.latlong.net/
  (e.g., 52.35695685)

- longitude: decimal longitude of the workshop venue, use
  https://www.latlong.net (e.g., 4.95433748205789)

- humandate: human-readable dates for the workshop (e.g., "December 24 - 26,
  2021, CET")

- humantime: human-readable times for the workshop (e.g., "7:00 - 9:00")

- startdate: machine-readable start date for the workshop (e.g.,
  "2021-12-24T00:00:00Z")

- enddate: machine-readable end date for the workshop (e.g.,
  "2021-12-26T00:00:00Z")

- instructor: comma-separated list of instructors' names as strings (e.g.,
  "Johan Hidding, Lieke de Boer, Mateusz Kuzak")

- helper: comma-separated list of helpers' names, (e.g., ,"Pushpanjali Pawar,
  Thijs van Lankveld")

- carpentry: "ds" for eScience Center Digital Skills, "swc" for Software
  Carpentry, "dc" for Data Carpentry, and "lc" for Library Carpentry.

- curriculum: lesson name (e.g. "ds-parallel")

- title: the title of the workshop (e.g. "Christmas special test workshop")

- slug: the name of workshop repository (e.g. "2021-12-24-dc-socsci-R-nlesc")

- flavor: the programming language used in the workshop (e.g. "R")

# repositories.csv

The file `repositories.csv` in  this directory contains the
   links of the lessons (in GitHub). 
  
- curriculum: e.g. `ds-parallel`

- slug: the GitHub address of a lesson e.g. `escience-digital-skills/lesson-parallel-python`
