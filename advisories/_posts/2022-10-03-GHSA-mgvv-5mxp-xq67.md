---
layout: advisory
title: 'GHSA-mgvv-5mxp-xq67 (sqlite3): SQLite3 addresses vulnerability in packaged
  version of libsqlite'
comments: false
categories:
- sqlite3
advisory:
  gem: sqlite3
  ghsa: mgvv-5mxp-xq67
  url: https://github.com/sparklemotion/sqlite3-ruby/security/advisories/GHSA-mgvv-5mxp-xq67
  title: SQLite3 addresses vulnerability in packaged version of libsqlite
  date: 2022-10-03
  description: |
    ### Summary

    The rubygem sqlite3 v1.5.1 upgrades the packaged version of libsqlite from
    v3.39.3 to [v3.39.4](https://sqlite.org/releaselog/3_39_4.html).

    libsqlite v3.39.4 addresses a vulnerability described as follows in the
    release notification:

    > Version 3.39.4 is a minimal patch against the prior release that addresses
    > issues found since the prior release. In particular, a potential
    > vulnerability in the FTS3 extension has been fixed, so this should be
    > considered a security update.
    >
    > In order to exploit the vulnerability, an attacker must have full SQL access
    > and must be able to construct a corrupt database with over 2GB of FTS3
    > content. The problem arises from a 32-bit signed integer overflow.

    This vulnerability has not been assigned a CVE and does not have a severity
    declared.

    Please note that this advisory only applies to the sqlite3 gem v1.5.0, and
    only if the packaged libsqlite is being used. If you've overridden defaults at
    installation time to use system libraries instead of packaged libraries, you
    should instead pay attention to your distro's libsqlite release announcements.


    ### Mitigation

    Upgrade to the rubygem sqlite3 v1.5.1 or later.

    Users who are unable to upgrade the sqlite3 gem may also choose a more
    complicated mitigation: compile and link sqlite3 against external libsqlite >=
    3.39.4 which will also address these same issues.


    ### References

    - Upstream release notes: https://sqlite.org/releaselog/3_39_4.html
    - Instructions for compiling against system libraries:
      https://github.com/sparklemotion/sqlite3-ruby
  unaffected_versions:
  - "< 1.5.0"
  patched_versions:
  - ">= 1.5.1"
  related:
    url:
    - https://github.com/sparklemotion/sqlite3-ruby/releases/tag/v1.5.1
---
