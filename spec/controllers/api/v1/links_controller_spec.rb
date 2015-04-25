require 'spec_helper'

describe Api::V1::LinksController do

  describe 'GET#index' do
    subject { get :index }

    specify { expect(subject).to be_success }
  end

end