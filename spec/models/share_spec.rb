require "spec_helper"

describe "Share" do
  let!(:tweet) { create :tweet }
  let!(:link) { create :link }

  specify { expect(Share.all).to match_array [tweet, link] }

end