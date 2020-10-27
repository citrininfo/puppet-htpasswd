require 'spec_helper'

describe "htpasswd::ht_md5" do
  let(:scope) { PuppetlabsSpec::PuppetInternals.scope }

  it { is_expected.to run.with_params('password', 'salt') }

  it { is_expected.to run.with_params('missingArgument').and_raise_error(ArgumentError) }

  it { is_expected.to run.with_params('to','many','arguments').and_raise_error(ArgumentError) }

  it "should raise a ArgumentError if passed not a string" do
    is_expected.to run.with_params(24,'wrong_type').and_raise_error(ArgumentError)
  end

  it "should return a MD5 password" do
    is_expected.to run.with_params('testpassword', 'PhT5FuSg').and_return('$apr1$PhT5FuSg$3o4QbIJfx4SZMLaa9T1A9.')
  end
end
