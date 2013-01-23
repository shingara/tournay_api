require 'integrations/spec_helper'

describe "Seed script" do
  it 'should not failed' do
    require_relative '../../db/seeds'
  end
end
