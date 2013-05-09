require 'spec_helper'
require 'cancan/matchers'

describe 'User' do
  describe 'abilities' do
    subject { ability }
    let(:ability) { Ability.new(user) }
    let(:user) { nil }

    context 'when is an admin' do
      let(:user){ create :user, :admin }

      it{ should be_able_to(:create, User.new) }
      it{ should be_able_to(:create, Link.new) }
    end

    context 'when is an member' do
      let(:user){ create :user, :member }

      it{ should_not be_able_to(:create, User.new) }
      it{ should_not be_able_to(:create, Link.new) }
    end
  end
end