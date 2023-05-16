---
layout: advisory
title: 'GHSA-xfhh-rx56-rxcr (yard): Possible arbitrary path traversal and file access
  via `yard server`'
comments: false
categories:
- yard
advisory:
  gem: yard
  ghsa: xfhh-rx56-rxcr
  date: 2019-07-02
  url: https://github.com/lsegal/yard/security/advisories/GHSA-xfhh-rx56-rxcr
  title: Possible arbitrary path traversal and file access via `yard server`
  description: |
    A path traversal vulnerability was discovered in YARD <= 0.9.19 when
    using `yard server` to serve documentation. This bug would allow unsanitized HTTP
    requests to access arbitrary files on the machine of a yard server host under certain
    conditions.
  patched_versions:
  - ">= 0.9.20"
---
