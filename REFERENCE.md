## Reference

### Defined Types
*[`htpasswd`](#htpasswd): Adds User&Password to given File
*[`htgroup`](#htgroup): Adds Usergroups to given File

### Functions
*[`htpasswd::ht_crypt`](#htpasswdht_crypt)
*[`htpasswd::ht_md5`](#htpasswdht_md5)
*[`htpasswd::ht_sha1`](#htpasswdht_sha1)

### htpasswd
Manage User in given htpasswd file

#### parameters
##### cryptpassword
Data Type: `String`

##### target
Data Type: `Path`

Path to htpasswd to manage user in
##### username
Data Type: `String`

Default Value: `$title`


### htgroup
Manage groups in htgroup file

#### parameters

##### target
Data Type: `Path`

Path to htgroup to manage

##### users
Data Type: `Array`/`String`

Default Value: `$title`

### htpasswd::ht_crypt
Type: Ruby 4.x API

encrypt 'password' with 'salt' using the crypt method

#### `htpasswd::ht_crypt(password, salt)`
Returns: `String`

##### `password`
Data Type: `String`

##### `salt`
Data Type: `String`

### htpasswd::ht_md5
Type: Ruby 4.x API

encrypt 'password' with 'salt' using the apache MD5 method
#### `htpasswd::ht_md5(password, salt)`
Returns: `String`

##### `password`
Data Type: `String`

##### `salt`
Data Type: `String`

### htpasswd::ht_sha1
Type: Ruby 4.x API

encrypt 'password' using the apache SHA1 method
#### `htpasswd::ht_sha1(password)`
Returns: `String`
##### `password`
Data Type: `String`
