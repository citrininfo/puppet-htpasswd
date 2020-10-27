# Changelog

All notable changes to this project will be documented in this file.

## Release 1.0.1

**Fixes**
- corrected puppet version requirement in metadata

**Changes**

- change readme.md to be more readable on puppetforge
- Move References to REFERENCE.md
- add usage example for random passwords to README.md

## Release 1.0.0

**Features**
- Updated Module to work with Puppet 6
- Updated Module to PDK 1.18
- Rewritten Tests to puppet-rspec 2.7.x
- Namespaced Functions for clarity

If you migrate from `leinaddm/puppet-htpasswd v0.0.3` change your function calls in your manifests as follows:
- ht_md5() => htpasswd::ht_md5()
- ht_crypt() => htpasswd::ht_crypt()
- ht_sha1() => htpasswd::ht_sha1()

## Release 0.0.3 and before

Cloned Module of https://github.com/leinaddm/puppet-htpasswd