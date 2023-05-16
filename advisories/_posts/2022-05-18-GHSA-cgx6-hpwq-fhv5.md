---
layout: advisory
title: 'GHSA-cgx6-hpwq-fhv5 (nokogiri): Integer Overflow or Wraparound in libxml2
  affects Nokogiri'
comments: false
categories:
- nokogiri
advisory:
  gem: nokogiri
  ghsa: cgx6-hpwq-fhv5
  url: https://github.com/sparklemotion/nokogiri/security/advisories/GHSA-cgx6-hpwq-fhv5
  title: Integer Overflow or Wraparound in libxml2 affects Nokogiri
  date: 2022-05-18
  description: |
    ### Summary

    Nokogiri v1.13.5 upgrades the packaged version of its dependency libxml2 from
    v2.9.13 to [v2.9.14](https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.9.14).

    libxml2 v2.9.14 addresses [CVE-2022-29824](https://nvd.nist.gov/vuln/detail/CVE-2022-29824).
    This version also includes several security-related bug fixes for which CVEs were not created,
    including a potential double-free, potential memory leaks, and integer-overflow.

    Please note that this advisory only applies to the CRuby implementation of Nokogiri
    `< 1.13.5`, and only if the _packaged_ libraries are being used. If you've overridden
    defaults at installation time to use _system_ libraries instead of packaged libraries,
    you should instead pay attention to your distro's `libxml2` and `libxslt` release announcements.

    ### Mitigation

    Upgrade to Nokogiri `>= 1.13.5`.

    Users who are unable to upgrade Nokogiri may also choose a more complicated mitigation:
    compile and link Nokogiri against external libraries libxml2 `>= 2.9.14` which will also
    address these same issues.

    ### Impact

    #### libxml2 [CVE-2022-29824](https://nvd.nist.gov/vuln/detail/CVE-2022-29824)

    - **CVSS3 score**:
      - Unspecified upstream
      - Nokogiri maintainers evaluate at 8.6 (High) ([CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:L/A:H](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:L/I:L/A:H)). Note that this is different from the CVSS assessed by NVD.
    - **Type**: Denial of service, information disclosure
    - **Description**: In libxml2 before 2.9.14, several buffer handling functions in buf.c (xmlBuf*) and tree.c (xmlBuffer*) don't check for integer overflows. This can result in out-of-bounds memory writes. Exploitation requires a victim to open a crafted, multi-gigabyte XML file. Other software using libxml2's buffer functions, for example libxslt through 1.1.35, is affected as well.
    - **Fixed**: https://gitlab.gnome.org/GNOME/libxml2/-/commit/2554a24

    All versions of libml2 prior to v2.9.14 are affected.

    Applications parsing or serializing multi-gigabyte documents (in excess of INT_MAX bytes) may be vulnerable to an integer overflow bug in buffer handling that could lead to exposure of confidential data, modification of unrelated data, or a segmentation fault resulting in a denial-of-service.


    ### References

    - [libxml2 v2.9.14 release notes](https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.9.14)
    - [CVE-2022-29824](https://nvd.nist.gov/vuln/detail/CVE-2022-29824)
    - [CWE-119: Improper Restriction of Operations within the Bounds of a Memory Buffer](https://cwe.mitre.org/data/definitions/119.html)
  cvss_v3: 8.6
  patched_versions:
  - ">= 1.13.5"
  related:
    url:
    - https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.9.14
    cve:
    - 2022-29824
---
