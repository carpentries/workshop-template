{{"

By default, the template displays the typical schedule for your workshop based on the values of the variables set in the `_config.yml`.
If you need to  make minor modifications to this schedule, you can edit the `schedule.html` file found in the sub-folder of the `_includes` folder that matches the type of workshop you will be teaching (`dc`, `lc`, or `swc`).

If you wish to create your own custom schedule, an empty template is available in `_includes/custom-schedule.html`.
In this file, we provide the structure for a 4-day workshop as it is often used for online workshops.
To use this custom schedule instead of the one provided by default in the template, delete the block of code found under the 'Schedule' header in the `index.md` file and replace it with `include custom-schedule.html`.

The schedule is formatted using a table. If you would like to learn more about how to write tables in HTML, here is an [HTML table overview from Mozilla](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/table) and the [HTML tables chapter from w3schools](https://www.w3schools.com/html/html_tables.asp).

For pilot workshops, some placeholder text including a link to the lesson homepage will be displayed instead of a schedule table.
The lesson homepage will contain estimated timings for teaching the lesson.
Use the approach described above for `_includes/custom-schedule.html` if you would like to create a schedule table to replace this text.

" | markdownify }}