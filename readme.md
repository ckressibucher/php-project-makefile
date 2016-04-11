PHP Project set-up using GNU make Makefile
=========================================

This aims to be a starting point for your
new PHP project. It defines tasks which
are common to most of the PHP projects
as Makefile targets.

Usage
--------

1. clone this repository
2. run `make` (this will install dependencies and run the linter and tests).
3. run `make list` to see other targets.

After that, you may want to have a look at the Makefile itself,
and adopt it to your project.

About build tools and task runners
----------------------------------

As PHP is a dynamic language without
compilation, there was not much need
for a tool like [Make](https://www.gnu.org/software/make/).
Since some years though, the set-ups
even for PHP projects have become more
complex. As a result, there are many
*Task runners* available. In PHP, a
good one of those is [robo.li](http://robo.li/).

What they (normally) don't allow, is the
declaration of dependencies, which allow
to run an *incremental build* (where the "build"
could actually be anything). This is very
important in traditional build tools like *Make*.

Why Make (and not phing, ant, ...)
----------------------------------

First of all, as described above, I want a tool which
knows the dependency graph of my application. Depending
on the application, it could make sense to use a
task runner (*robo.li*, or one of the JavaScript task
runners, which provide very useful tools for frontend
development) *in addition* to a "real" build tool.

I don't like the xml declaration style used by
build tools like *ant* or *phing*. In my opinion,
the syntax of a Makefile is much more readable and
concise (once you got used to the few *automatic variables*).

Another reason is that you can define commands which are
directly executed in a shell. For common tasks, such as
file-system operations, this is much easier and faster
than using PHP. The downside of course is, that it
doesn't work on every platform (if you don't be very
careful which commands you use).

Features
----------

The Makefile target which are intended to be used from the
command line, are listed by `make list`:

```sh
$ make list

Useful targets:

  test         > run linter and tests (default target)
  phplint      > run php linter (php -l)
  phpspec      > run phpspec

  setup        > install composer dependencies
  deps_update  > explicitly update dependencies (composer update)
  clean        > stop server, clean tmp files and vendor dir
  clean_tmp    > clean temporary files (and stop server)
  clean_vendor > remove vendor dir

  server_start > start dev server
  server_stop  > stop dev server
```

The dependencies of each target (*prerequisites* in make terminology)
are declared very carefully, so that you can run `make test` and
only the out-of-date targets are updated. Examples:

* You can directly start with `make test` (or just `make`, as `test`
  is the default target). It sees that the composer dependencies
  are not yet installed, and runs `composer install`.
* `make test` does not do anything, if you have not updated any
  source files.
* `make phplint` only lints the modified source files.

There are a few PHP
files included, but only as an example project. The idea
is to *not* limit you on your choices regarding frameworks,
project structure, and so on. The only choice which is done,
is the testing tool, which is *phpspec*. This allows
to show a useful implementation of a `test` target.
It should be very easy to use *phpunit* instead: just
change the dependency in the composer.json and modify
the phpspec target to call phpunit instead.

