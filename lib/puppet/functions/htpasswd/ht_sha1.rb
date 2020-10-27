require 'digest/sha1'
require 'base64'

Puppet::Functions.create_function(:'htpasswd::ht_sha1') do
  dispatch :ht_sha1 do
    param 'String', :value
  end

  def ht_sha1(value)
    "{SHA}"+Base64.encode64(Digest::SHA1.digest(value)).chomp!
  end
end