---
layout: advisory
title: 'GHSA-r9cr-qmfw-pmrc (camaleon_cms): Camaleon CMS vulnerable to stored XSS
  through user file upload (GHSL-2024-184)'
comments: false
categories:
- camaleon_cms
advisory:
  gem: camaleon_cms
  ghsa: r9cr-qmfw-pmrc
  url: https://github.com/owen2345/camaleon-cms/security/advisories/GHSA-r9cr-qmfw-pmrc
  title: Camaleon CMS vulnerable to stored XSS through user file upload (GHSL-2024-184)
  date: 2024-09-18
  description: |
    A stored cross-site scripting has been found in the image upload
    functionality that can be used by normal registered users:
    It is possible to upload a SVG image containing JavaScript and
    it's also possible to upload a HTML document when the format
    parameter is manually changed to [documents][1] or a string of an
    [unsupported format][2]. If an authenticated user or administrator
    visits that uploaded image or document malicious JavaScript can be
    executed on their behalf
    (e.g. changing or deleting content inside of the CMS.)

    [1]: https://github.com/owen2345/camaleon-cms/blob/feccb96e542319ed608acd3a16fa5d92f13ede67/app/uploaders/camaleon_cms_uploader.rb#L105-L106
    [2]: https://github.com/owen2345/camaleon-cms/blob/feccb96e542319ed608acd3a16fa5d92f13ede67/app/uploaders/camaleon_cms_uploader.rb#L110-L111

    ## Impact

    This issue may lead to account takeover due to reflected
    Cross-site scripting (XSS).

    ## Remediation

    Only allow the upload of safe files such as PNG, TXT and others
    or serve all "unsafe" files such as SVG and other files with a
    content-disposition: attachment header, which should prevent
    browsers from displaying them.

    Additionally, a [Content security policy (CSP)][3]
    can be created that disallows inlined script. (Other parts of the
    application might need modification to continue functioning.)

    [3]: https://web.dev/articles/csp

    To prevent the theft of the auth_token it could be marked with
    HttpOnly. This would however not prevent that actions could be
    performed as the authenticated user/administrator. Furthermore,
    it could make sense to use the authentication provided by
    Ruby on Rails, so that stolen tokens cannot be used anymore
    after some time.
  cvss_v3: 5.4
  patched_versions:
  - ">= 2.8.1"
  related:
    url:
    - https://github.com/owen2345/camaleon-cms/security/advisories/GHSA-r9cr-qmfw-pmrc
    - https://github.com/owen2345/camaleon-cms/commit/b18fbc74f3ecd98a1f781d015f5466ef16b1425b
    - https://github.com/advisories/GHSA-r9cr-qmfw-pmrc
---
