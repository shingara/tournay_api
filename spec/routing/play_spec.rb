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
end
