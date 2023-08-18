---
layout: advisory
title: 'GHSA-68xg-gqqm-vgj8 (puma): Inconsistent Interpretation of HTTP Requests (''HTTP
  Request/Response Smuggling'') in puma'
comments: false
categories:
- puma
advisory:
  gem: puma
  ghsa: 68xg-gqqm-vgj8
  url: https://github.com/puma/puma/security/advisories/GHSA-68xg-gqqm-vgj8
  title: Inconsistent Interpretation of HTTP Requests ('HTTP Request/Response Smuggling')
    in puma
  date: 2023-08-18
  description: |
    ### Impact

    Prior to version 6.3.1, puma exhibited incorrect behavior when parsing chunked transfer encoding bodies and zero-length Content-Length headers in a way that allowed HTTP request smuggling.

    The following vulnerabilities are addressed by this advisory:
    - Incorrect parsing of trailing fields in chunked transfer encoding bodies
    - Parsing of blank/zero-length Content-Length headers`\r\n`

    ### Patches

    The vulnerability has been fixed in 6.3.1 and 5.6.7.

    ### Workarounds

    No known workarounds.

    ### References

    [HTTP Request Smuggling](https://portswigger.net/web-security/request-smuggling)
  cvss_v3: 6.5
  patched_versions:
  - "~> 5.6.7"
  - ">= 6.3.1"
  related:
    url:
    - https://github.com/puma/puma/commit/690155e7d644b80eeef0a6094f9826ee41f1080a
---
