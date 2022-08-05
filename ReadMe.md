Test::More::Bash
================

Write Perl tests in Bash

## Synopsis

A file `t/test.t`:
```
#!/usr/bin/env test-more-bash

plan 8

pass "This test will always 'pass'"

t() (
  fail "This test will always 'fail'"
)
todo "Testing 'todo'" t

note "NOTE: This is awesome"

diag "This is a WARNING"

ok true \
  "Testing 'ok'"

is "$((2 + 2))" 4 \
  "2 + 2 'is' 4"

isnt "$((2 + 2))" 5 \
  "2 + 2 'isnt' 5"

like "I like pie!" \
  "/\<like\>/" \
  "Testing 'like'"

unlike \
  "Please like me on Facebook" \
  "/\<unlike\>/" \
  "Testing 'unlike'"

t() (
  danger zone
)
skip "Skipping - Highway to the danger zone" t
```

Run `prove t/test.t`:
```
test/test.t ..
1..8
ok 1 - This test will always 'pass'
not ok 2 # TODO & SKIP Testing 'todo'
# NOTE: This is awesome
ok 3 - Testing 'ok'
# This is a WARNING!
ok 4 - 2 + 2 'is' 4
ok 5 - 2 + 2 'isnt' 5
ok 6 - Testing 'like'
ok 7 - Testing 'unlike'
ok 8 # skip Skipping - Highway to the danger zone
ok
All tests successful.
Files=1, Tests=8,  0 wallclock secs ( 0.02 usr  0.01 sys +  0.12 cusr  0.02 csys =  0.17 CPU)
Result: PASS
```

## Description

Test::More::Bash let's you write Perl module tests in Bash.

You just add this shebang line to a `t/test-file.t`:
```
#!/usr/bin/env test-more-bash
```

### Alternate Usage

Instead of using a special shebang line to get the desired behavior, you can
start with this Perl line:

```
use Test::More::Bash;
```

The test file will initially be run as Perl, but Test::More::Bash will exec a
command that runs the file as Bash.
The Bash runtime code defines a pass through Bash function called `use` that
will effectively ignore the `use Test::More::Bash;` line.

NOTE: Passing extra parameters on the `use Test::More::Bash` line is not yet supported.
In other words, you can't do:

```
use Test::More::Bash tests => 5;
```

Instead just do:

```
use Test::More::Bash;

plan 5
```

## Authors

* Ingy döt Net <ingy@ingy.net>

## Copyright and License

Copyright 2022 by Ingy döt Net

This library is free software and may be distributed under the same terms as
perl itself.
