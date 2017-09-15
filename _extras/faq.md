---
layout: page
title: FAQ
permalink: /faq/
---

## General

*Where can I get help?*
:   Mail us at [{{site.email}}](mailto:{{site.email}}),
    or join our [discussion list]({{site.swc_site}}/join/)
    and ask for help there.

*What if I can't wait?*
:   Run `make workshop-check` to run the workshop homepage checking program on `index.html`.

*Where can I report problems or suggest improvements?*
:   Please file an issue against [{{site.workshop_repo}}](this repository)
    or [mail us](mailto:{{site.email}}).

*Why does the workshop repository have to be created by importing rather than forking?*
:   Because any particular user can only have one fork of a repository,
    but instructors frequently need to work on several workshops at once.

*Why do I have to be logged in before I start the import?*
:   It's a known issue with GitHub's importer.

*Why does the workshop repository name have to follow the `YYYY-MM-DD-site` pattern?*
:   This makes it easy for coordinators to track workshops.
    There are plans to move that coordination into [AMY][amy],
    but until that happens this pattern makes it easy to sort workshops
    by date without requiring an additional start-date column.
    **Note: `YYYY-MM-DD` should be the start date of the workshop.**

*Why use the `gh-pages` branch instead of `master`?*
:   Because [GitHub automatically publishes `gh-pages`][github-pages] as a website.

*Why use Jekyll?  Why not some other markup language and some other converter?*
:   Because it's the only tool supported by GitHub Pages.

*Where should pages go if multiple workshops are running at a site simultaneously?*
:   Use subdirectories like `2015-07-01-esu/beginners`,
    so that repository names always follow our four-part convention.

*What if I want to add more values to `index.html`, like `address1` and `address2` for different rooms on different days?*
:   Go ahead,
    but you *must* have the variables described in the customization instructions.

*What is the "Windows installer"?*
:   We have built a small installation helper for Windows
    that installs nano and SQLite, adds R to the path, and so on.
    It is maintained in
    <https://github.com/swcarpentry/windows-installer>
    which also has an up-to-date description of what it actually does.
    The latest version is always available at
    <http://files.software-carpentry.org/SWCarpentryInstaller.exe>,
    and contributions are always welcome.

## Debugging

*Help, my website is not updating!*
:   Ensure that strings in the header of `index.html` are enclosed in quotations `"`.
    Special characters such as `"&"` may render correctly on your local machine
    but cause rendering to fail silently on GitHub.

*Eventbrite registration isn't showing up on the workshop's home page.*
:   First check that you have something like:

    ~~~
    eventbrite: 1234567890AB
    ~~~

    in the YAML header of `index.html`.
    If the YAML header is set properly you may be accessing
    `file:///home/to/workshop/directory/_site/index.html` directly.
    Instead,
    please run

    ~~~
    $ make serve
    ~~~

    and look at `http://localhost:4000` in your browser
    (or push your changes to GitHub and view your page there).

*What do I do if I see a `invalid byte sequence in ...` error when I run `tools/check`?*
:   Your computer is telling you that it doesn't understand some of the characters you're using.
    Declare your locale to be `en_US.UTF-8` in your shell:

    ~~~
    $ export LC_ALL=en_US.UTF-8
    $ export LANG=en_US.UTF-8
    ~~~

*What do I do if I get a "can't convert nil into String" error?*
:   On some Linux distributions (e.g, Ubuntu 14.04), you may get this error:

    ~~~
    $ ./tools/preview
    /usr/lib/ruby/1.9.1/rubygems/custom_require.rb:36:in `require': iconv will be deprecated in the future, use String#encode instead.
    /usr/lib/ruby/1.9.1/time.rb:265:in `_parse': can't convert nil into String (TypeError)
	    from /usr/lib/ruby/1.9.1/time.rb:265:in `parse'
	    from /usr/bin/jekyll:95:in `block (2 levels) in <main>'
	    from /usr/lib/ruby/1.9.1/optparse.rb:1391:in `call'
	    from /usr/lib/ruby/1.9.1/optparse.rb:1391:in `block in parse_in_order'
	    from /usr/lib/ruby/1.9.1/optparse.rb:1347:in `catch'
	    from /usr/lib/ruby/1.9.1/optparse.rb:1347:in `parse_in_order'
	    from /usr/lib/ruby/1.9.1/optparse.rb:1341:in `order!'
	    from /usr/lib/ruby/1.9.1/optparse.rb:1432:in `permute!'
	    from /usr/lib/ruby/1.9.1/optparse.rb:1453:in `parse!'
	    from /usr/bin/jekyll:137:in `<main>'
    ~~~

    This occurs because you are using an old version of Jekyll located in `/usr/bin`.
    Make sure that you have installed Jekyll using:

    ~~~
    $ gem install jekyll
    ~~~

    This installs Jekyll in `/usr/local/bin`,
    so make sure this directory comes before `/usr/bin` in your `PATH` environment variable.
    When your path is set correctly,
    you should see:

    ~~~
    $ which jekyll
    /usr/local/bin/jekyll
    ~~~

    You may also have to install the `nodejs` package to disable references to JavaScript,
    which you can do using:

    ~~~
    $ sudo apt-get install nodejs
    ~~~

    For more information,
    see <http://michaelchelen.net/81fa/install-jekyll-2-ubuntu-14-04/>.

[amy]: https://github.com/swcarpentry/amy
[github-pages]: https://help.github.com/articles/creating-project-pages-manually/
