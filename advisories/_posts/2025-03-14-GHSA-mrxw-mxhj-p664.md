---
layout: advisory
title: 'GHSA-mrxw-mxhj-p664 (nokogiri): Nokogiri updates packaged libxslt to v1.1.43
  to resolve multiple CVEs'
comments: false
categories:
- nokogiri
advisory:
  gem: nokogiri
  ghsa: mrxw-mxhj-p664
  url: https://github.com/sparklemotion/nokogiri/security/advisories/GHSA-mrxw-mxhj-p664
  title: Nokogiri updates packaged libxslt to v1.1.43 to resolve multiple CVEs
  date: 2025-03-14
  description: |
    ## Summary

    Nokogiri v1.18.4 upgrades its dependency libxslt to
    [v1.1.43](https://gitlab.gnome.org/GNOME/libxslt/-/releases/v1.1.43).

    libxslt v1.1.43 resolves:

    - CVE-2025-24855: Fix use-after-free of XPath context node
    - CVE-2024-55549: Fix UAF related to excluded namespaces

    ## Impact

    ### CVE-2025-24855

    - "Use-after-free due to xsltEvalXPathStringNs leaking xpathCtxt->node"
    - MITRE has rated this 7.8 High CVSS:3.1/AV:L/AC:H/PR:N/UI:N/S:C/C:N/I:H/A:H
    - Upstream report: https://gitlab.gnome.org/GNOME/libxslt/-/issues/128
    - NVD entry: https://nvd.nist.gov/vuln/detail/CVE-2025-24855

    ### CVE-2024-55549

    - "Use-after-free related to excluded result prefixes"
    - MITRE has rated this 7.8 High CVSS:3.1/AV:L/AC:H/PR:N/UI:N/S:C/C:N/I:H/A:H
    - Upstream report: https://gitlab.gnome.org/GNOME/libxslt/-/issues/127
    - NVD entry: https://nvd.nist.gov/vuln/detail/CVE-2024-55549
  cvss_v3: 7.8
  patched_versions:
  - ">= 1.18.4"
  related:
    url:
    - https://github.com/sparklemotion/nokogiri/security/advisories/GHSA-mrxw-mxhj-p664
    - https://gitlab.gnome.org/GNOME/libxslt/-/issues/127
    - https://gitlab.gnome.org/GNOME/libxslt/-/issues/128
    - https://github.com/advisories/GHSA-mrxw-mxhj-p664
    cve:
    - https://nvd.nist.gov/vuln/detail/CVE-2024-55549
    - https://nvd.nist.gov/vuln/detail/CVE-2025-24855
---
