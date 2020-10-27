# Encrypt Password with crypt
Puppet::Functions.create_function(:'htpasswd::ht_crypt') do
  dispatch :ht_crypt do
    param 'String', :password
    param 'String', :salt
    return_type 'String'
  end

  def ht_crypt(password, salt)
    password.crypt(salt)
  end
end