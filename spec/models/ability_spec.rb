require 'spec_helper'
require 'cancan/matchers'

describe 'User' do
  describe 'abilities' do
    subject { ability }
    let(:ability) { Ability.new(user) }
    let(:user) { nil }

    context 'Admin abilities' do
      let(:user){ create :user, :admin }

      it{ should be_able_to(:manage, User) }
      it{ should be_able_to(:manage, Link) }
    end

    context 'Member abilities' do
      let(:user){ create :user }
      let(:another_user){ create :user }
      let(:link) { create :link, user: user }
      let(:another_user_link) { create :link }

      context 'Abilities about User' do
        it{ should be_able_to(:show, user) }
        it{ should_not be_able_to(:show, another_user) }
        it{ should_not be_able_to(:index, User) }
        it{ should_not be_able_to(:new, User) }
        it{ should_not be_able_to(:create, User) }
        it{ should_not be_able_to(:update, User) }
      end

      context 'Abilities about Link' do
        it { should be_able_to(:index, Link) }
        it { should be_able_to(:new, Link) }
        it { should be_able_to(:create, Link) }
        it { should be_able_to(:update, link) }
        it { should_not be_able_to(:update, another_user_link) }
        it { should be_able_to(:destroy, link) }
        it { should_not be_able_to(:destroy, another_user_link) }
      end
    end

    context 'Guest abilities' do
      it{ should_not be_able_to(:index, User) }
      it{ should_not be_able_to(:new, User) }
      it{ should_not be_able_to(:create, User) }
      it{ should_not be_able_to(:update, User) }
      it{ should be_able_to(:index, Link) }
      it{ should be_able_to(:show, Link) }
      it{ should_not be_able_to(:new, Link) }
      it{ should_not be_able_to(:edit, Link) }
      it{ should_not be_able_to(:create, Link) }
      it{ should_not be_able_to(:update, Link) }
      it{ should_not be_able_to(:destroy, Link) }
    end
  end
end