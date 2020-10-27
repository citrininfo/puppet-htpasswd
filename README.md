# htpasswd
Puppet module to manage htpasswd and htgroup files.

Made for Users who need to be a bit more Flexible than the Apache module allows.

Adds Functions to generate Passwords for htpasswd file-line with different methods.
Currently included are:

- crypt
- md5
- sha1

The Apache Module currently uses sha1 Quote:
> ### apache::pw_hash
> Currently uses SHA-hashes, because although this format is considered insecure, it's the most secure format supported by the most platforms.
>
> https://forge.puppet.com/puppetlabs/apache/reference#apachepw_hash

This module currently does not manage the owner/group/mode of the htpasswd and
htgroup files you specify.

Module is a Fork of https://github.com/leinaddm/puppet-htpasswd.

## Compatibility
Puppet >= v5.0

## htpasswd type

### add a user

    htpasswd { 'dan':
      cryptpasswd => 'MrC7Aq3qPKPaK',  # encrypted password
      target      => '/etc/httpd/conf/htpasswd',
    }

### add a second user with the same username to a different file

    htpasswd { 'dan2':
      username    => 'dan',
      cryptpasswd => 'djkhfsdhfkjsd',  # encrypted password
      target      => '/etc/httpd/conf/htpasswd2',
    }

### remove a user

    htpasswd { user:
      ensure => absent,
      target => '/etc/httpd/conf/htpasswd',
    }

## htgroup type

#### add a group

    htgroup { groupname:
      users  => [ user1, user2, ],
      target => '/etc/httpd/conf/htgroup',
    }

#### remove a group

    htgroup { groupname:
      ensure => absent,
      target => '/etc/httpd/conf/htgroup',
    }

## helper parser functions

### htpasswd::ht_crypt('password', 'salt')
encrypt 'password' with 'salt' using the crypt method

### htpasswd::ht_md5('password', 'salt')
encrypt 'password' with 'salt' using the apache MD5 method

### htpasswd::ht_sha1('password')
encrypt 'password' using the apache SHA1 method

# Credits
- Module is a Fork of https://github.com/leinaddm/puppet-htpasswd 
- Apache MD5 algorithm ruby implementation taken from https://github.com/copiousfreetime/htauth by Jeremy Hinegardner.
