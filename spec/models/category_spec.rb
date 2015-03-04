require 'spec_helper'

describe 'Category' do
  let(:category) { build :category }

  subject { category }

  describe 'testing validations' do
    it { should be_valid }
    it { subject.save.should be_truthy }

    context 'testing uniqueness validation on name attribute' do
      let(:another_category) { build :category, name: category.name }
      before { category.save }

      it { another_category.should_not be_valid }
      it { another_category.save.should_not be_truthy }
    end

    context 'testing presence validation on name attribute' do
      let(:another_category) { build :category, name: '' }
      before { category.save }

      it { another_category.should_not be_valid }
      it { another_category.save.should_not be_truthy }
    end
  end
end