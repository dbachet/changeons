require 'spec_helper'

describe 'Link' do
  let(:link) { build :link }

  subject { link }

  describe 'testing validations' do
    it { should be_valid }
    it { subject.save.should be_true }
  end
end