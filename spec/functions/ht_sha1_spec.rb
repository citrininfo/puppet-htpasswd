require 'spec_helper'

describe "htpasswd::ht_sha1" do
  let(:scope) { PuppetlabsSpec::PuppetInternals.scope }

  it { is_expected.to run.with_params('password') }

  it { is_expected.to run.with_params([]).and_raise_error(ArgumentError) }

  it { is_expected.to run.with_params('to','many','arguments').and_raise_error(ArgumentError) }

  it "should raise a ArgumentError if passed not a string" do
    is_expected.to run.with_params(24).and_raise_error(ArgumentError)
  end

  it "should return a MD5 password" do
    is_expected.to run.with_params('testpassword').and_return('{SHA}i7YRj4/Wk1rQh2o740pxfTJwj/0=')
  end

end
