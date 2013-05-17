require 'spec_helper'
describe "routing to profiles" do
  it { expect(:get => "/admin/categories").to route_to 'categories#index' }
  it { expect(:get => "/admin/categories/new").to route_to 'categories#new' }
  it { expect(:get => "/admin/categories/1/edit").to route_to 'categories#edit', id: '1' }
  it { expect(:post => "/admin/categories").to route_to 'categories#create' }
  it { expect(:patch => "/admin/categories/1").to route_to 'categories#update', id: '1' }
  it { expect(:delete => "/admin/categories/1").to route_to 'categories#destroy', id: '1' }

end