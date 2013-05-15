require 'spec_helper'

describe 'Link' do
  let(:link) { build :link }

  subject { link }

  describe 'testing validations' do
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
  end
end