require 'spec_helper'

describe "API Routing" do
  it 'route to start' do
    expect({
      :post => '/games/start'
    }).to route_to(
      :controller => 'games',
      :action => 'start'
    )
  end

  it 'route to show game' do
    expect({
      :get => '/games/123'
    }).to route_to(
      :controller => 'games',
      :action => 'show',
      :id => '123'
    )
  end
end
