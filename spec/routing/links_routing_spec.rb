require 'spec_helper'
describe "routing to profiles" do
  it { expect(:get => "/links").to route_to 'links#index' }
  it { expect(:get => "/links/new").to route_to 'links#new' }
  it { expect(:get => "/links/1/edit").to route_to 'links#edit', id: '1' }
  it { expect(:post => "/links").to route_to 'links#create' }
  it { expect(:patch => "/links/1").to route_to 'links#update', id: '1' }
  it { expect(:delete => "/links/1").to route_to 'links#destroy', id: '1' }

end