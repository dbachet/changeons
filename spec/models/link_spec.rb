require 'spec_helper'

describe 'Link' do

  describe 'testing validations' do
    let(:link) { build :link }
    subject { link }

    it { should be_valid }
    it { subject.save.should be_true }

    context 'testing uniqueness validation on name attribute' do
      let(:another_link) { build :link, name: link.name }
      before { link.save }

      it { another_link.should_not be_valid }
      it { another_link.save.should_not be_true }
    end

    context 'testing uniqueness validation on url attribute' do
      let(:another_link) { build :link, url: link.url }
      before { link.save }

      it { another_link.should_not be_valid }
      it { another_link.save.should_not be_true }
    end

    context 'testing presence validation on name attribute' do
      let(:another_link) { build :link, name: '' }
      before { link.save }

      it { another_link.should_not be_valid }
      it { another_link.save.should_not be_true }
    end

    context 'testing presence validation on url attribute' do
      let(:another_link) { build :link, url: '' }
      before { link.save }

      it { another_link.should_not be_valid }
      it { another_link.save.should_not be_true }
    end

    context 'testing presence validation on language attribute' do
      let(:another_link) { build :link, language: '' }
      before { link.save }

      it { another_link.should_not be_valid }
      it { another_link.save.should_not be_true }
    end

    context 'testing inclusion validation on language attribute' do
      let(:another_link) { build :link, language: 'JK' }
      before { link.save }

      it { another_link.should_not be_valid }
      it { another_link.save.should_not be_true }
    end

    context 'testing presence validation on category attribute' do
      let(:another_link) { build :link, category: nil }
      before { link.save }

      it { another_link.should_not be_valid }
      it { another_link.save.should_not be_true }
    end
  end

  describe '#disqus_uniq_identifier' do
    let(:link) { create :link }
    it { link.disqus_uniq_identifier.should eql 'test_LINK_1' }
  end

  describe '#disqus_category_id' do
    it { Link.disqus_category_id.should eql '2408371' }
  end

end