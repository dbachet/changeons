require "spec_helper"

describe TwitterApi do

  subject { TwitterApi.new }

  specify { expect(subject.client).to be_instance_of Twitter::REST::Client }

end