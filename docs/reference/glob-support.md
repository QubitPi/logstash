---
mapped_pages:
  - https://www.elastic.co/guide/en/logstash/current/glob-support.html
---

# Glob Pattern Support [glob-support]

Logstash supports the following patterns wherever glob patterns are allowed:

**`*`**
:   Match any file. You can also use an `*` to restrict other values in the glob. For example, `*conf` matches all files that end in `conf`. `*apache*` matches any files with `apache` in the name. This pattern does not match hidden files (dot files) on Unix-like operating systems. To match dot files, use a pattern like `{*,.*}`.

**`**`**
:   Match directories recursively.

**`?`**
:   Match any one character.

**`[set]`**
:   Match any one character in a set. For example, `[a-z]`. Also supports set negation (`[^a-z]`).

**`{p,q}`**
:   Match either literal `p` or literal `q`. The matching literal can be more than one character, and you can specify more than two literals. This pattern is the equivalent to using alternation with the vertical bar in regular expressions (`foo|bar`).

**`\`**
:   Escape the next metacharacter. This means that you cannot use a backslash in Windows as part of a glob. The pattern `c:\foo*` will not work, so use `foo*` instead.


## Example Patterns [example-glob-patterns]

Here are some common examples of glob patterns:

`"/path/to/*.conf"`
:   Matches config files ending in `.conf` in the specified path.

`"/var/log/*.log"`
:   Matches log files ending in `.log` in the specified path.

`"/var/log/**/*.log"`
:   Matches log files ending in `.log` in subdirectories under the specified path.

`"/path/to/logs/{app1,app2,app3}/data.log"`
:   Matches app log files in the `app1`, `app2`, and `app3` subdirectories under the specified path.

