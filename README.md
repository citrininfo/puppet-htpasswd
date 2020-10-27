# htpasswd
Puppet module to manage htpasswd and htgroup files.

Made for Users who need to be a bit more Flexible than the Apache module allows.

Adds Functions to generate Passwords for htpasswd file-line with different methods.
Currently included are:

- crypt
- md5
- sha1

The Apache Module currently uses sha1:

    apache::pw_hash
      Currently uses SHA-hashes, because although this format is considered insecure, it's the most secure format supported by the most platforms.
      https://forge.puppet.com/puppetlabs/apache/reference#apachepw_hash


This module currently does not manage the owner/group/mode of the htpasswd and
htgroup files you specify.

Module is a Fork of https://github.com/leinaddm/puppet-htpasswd.

### tldr
Module does not manage existence of htpasswd file. You need to add this yourself

#### add a user
    htpasswd { 'dan':
      cryptpasswd => 'MrC7Aq3qPKPaK',  # encrypted password
      target      => '/etc/httpd/conf/htpasswd',
    }

#### add a second user with the same username to a different file
    htpasswd { 'dan2':
      username    => 'dan',
      cryptpasswd => $password,  # encrypted password
      target      => '/etc/httpd/conf/htpasswd2',
    }

#### remove a user

    htpasswd { user:
      ensure => absent,
      target => '/etc/httpd/conf/htpasswd',
    }

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

#### Generate Random Password and export as file somewhere
Here is an example how you can use the module to generate random passwords based on host and user and export the password to somewhere; like a users workstation.

    $user = 'username'
    $htpasswd_charset = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@!'
    $password = htpasswd::ht_md5(
      fqdn_rand_string('32', $htpasswd_charset, $user),
      fqdn_rand_string('8', $htpasswd_charset, "${user}_salt")
    )

    @@file {$facts['fqdn']:
      ensure  => present,
      content => $password,
      user    => $user,
      group   => $user,
      mode    => '0600',
      tag     => 'sometag',
    }

    htpasswd { $user:
      ensure => present,
      cryptpassword => $password,
      target => '/path/to/htpasswd'
    }

# Credits
- Module is a Fork of https://github.com/leinaddm/puppet-htpasswd 
- Apache MD5 algorithm ruby implementation taken from https://github.com/copiousfreetime/htauth by Jeremy Hinegardner.
