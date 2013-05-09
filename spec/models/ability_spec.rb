require 'spec_helper'
require 'cancan/matchers'

describe 'User' do
  describe 'abilities' do
    subject { ability }
    let(:ability) { Ability.new(user) }
    let(:user) { nil }

    context 'when is an admin' do
      let(:user){ create :user, :admin }

      it{ should be_able_to(:manage, User.new) }
      it{ should be_able_to(:manage, Link.new) }
    end

    context 'when is an member' do
      let(:user){ create :user }

      it{ should_not be_able_to(:index, User.new) }
      it{ should_not be_able_to(:new, User.new) }
      it{ should_not be_able_to(:create, User.new) }
      it{ should_not be_able_to(:update, User.new) }
      it{ should be_able_to(:index, Link.new) }
      it{ should be_able_to(:show, Link.new) }
      it{ should_not be_able_to(:new, Link.new) }
      it{ should_not be_able_to(:edit, Link.new) }
      it{ should_not be_able_to(:create, Link.new) }
      it{ should_not be_able_to(:update, Link.new) }
      it{ should_not be_able_to(:destroy, Link.new) }
    end
  end
end