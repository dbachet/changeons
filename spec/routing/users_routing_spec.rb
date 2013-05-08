require 'spec_helper'
describe "routing to users" do
  it { expect(:get => "admin/users").to route_to 'users#index' }
  it { expect(:get => "/admin/users/new").to route_to 'users#new' }
end