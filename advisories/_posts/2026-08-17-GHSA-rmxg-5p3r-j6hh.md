---
layout: advisory
title: 'GHSA-rmxg-5p3r-j6hh (graphql): Unsafe Marshal deserialization in the parser
  cache can lead to arbitrary Ruby code execution'
comments: false
categories:
- graphql
advisory:
  gem: graphql
  ghsa: rmxg-5p3r-j6hh
  url: https://github.com/rmosolgo/graphql-ruby/security/advisories/GHSA-rmxg-5p3r-j6hh
  title: Unsafe Marshal deserialization in the parser cache can lead to arbitrary
    Ruby code execution
  date: 2026-08-17
  description: |-
    GraphQL::Language::Cache#fetch reads parser cache files and passes
    their contents directly to Marshal.load without authenticating the
    payloads. If an attacker can place a crafted payload in the expected
    path and the application calls GraphQL::Language::Parser.parse_file,
    then attacker-controlled marshal_load or _load methods are executed,
    resulting in arbitrary Ruby code execution in the application process.
  unaffected_versions:
  - "< 1.12.6"
  patched_versions:
  - ">= 2.6.9"
  related:
    url:
    - https://rubygems.org/gems/graphql/versions/2.6.9
    - https://github.com/rmosolgo/graphql-ruby/blob/master/CHANGELOG.md#269-17-aug-2026
    - https://github.com/rmosolgo/graphql-ruby/compare/v2.6.8...v2.6.9
    - https://github.com/rmosolgo/graphql-ruby/security/advisories/GHSA-rmxg-5p3r-j6hh
  notes: |
    - date from rubygems.org URL.
    - GHSA Severity is "High".
    - No CVE in GHSA url.
    - Note: gem name is "graphql" but repo name is "graphql-ruby".
---
