{{"

If you need assistance with customizing the setup instructions for your website, feel free to ask your questions in the Carpentries [Instructors Slack channel](https://carpentries.slack.com/archives/C08BVNU00) ([join The Carpentries Slack workspace](https://slack-invite.carpentries.org/)).

##### Software Carpentry workshops

###### Default settings

For Software Carpentry workshops, setting the `flavor` variable in `_config.yml` to `r` or `python` will include the respective installation instructions for these tools.
Additionally, by default, the installation instructions for a text editor, the Bash shell, and Git are included.

###### If you need to remove tools

If you need to remove any of the instructions for the default set of tools, you can delete lines that include these instructions in the `_includes/swc/setup.html` file.

###### If you need to add tools

If you need to add installation instructions for other tools, we provide installation instructions for SQL and OpenRefine.
To make them appear on your workshop website, you can move the `include` statements outside the comment block in `_includes/swc/setup.html`.

If you need to add installation instructions for other tools, you will need to write your own. You can use installation instructions for other tools located in the `_includes/install_instructions/` folder as examples.

##### Data Carpentry workshops

For Data Carpentry workshops, installation instructions live on the workshop overview page for each curriculum.
Instead of including installation instructions in the workshop template, the workshop template includes links to these instructions.
The correct link will be displyed when using the appropriate combination of values for the `curriculum`  and `flavor` variables in the `_config.yml` file.

##### Library Carpentry workshops

By default, Library Carpentry workshop websites include installation instructions for the Bash shell and Git.

You may need to add installation instructions for additional tools you will be using during your workshop by editing the `_includes/lc/setup.html` file.
You can either write your own instructions using the ones provided in `_includes/lc/setup.html` as an example, or, if you are using tools that already have installation instructions provided for Software Carpentry, you can add `include install_instructions/<filename.html>` where `<filename.html>` needs to be replaced by one of the files in the `_includes/install_instructions` folder.

" | markdownify }}