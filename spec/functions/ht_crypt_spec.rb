require 'spec_helper'

describe "htpasswd::ht_crypt" do
  let(:scope) { PuppetlabsSpec::PuppetInternals.scope }

  it { is_expected.to run.with_params('password','salt') }

  it { is_expected.to run.with_params('missingArgument').and_raise_error(ArgumentError) }

  it { is_expected.to run.with_params('to','many','arguments').and_raise_error(ArgumentError) }

  it "should raise a ArgumentError if passed not a string" do
    is_expected.to run.with_params(24,'wrong_type').and_raise_error(ArgumentError)
  end

  it "should return a Crypt password" do
    is_expected.to run.with_params('testpassword', '46').and_return('46ursI0BCy7gc')
  end
end
