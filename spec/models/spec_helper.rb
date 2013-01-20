require 'spec_helper'
require 'mongoid-rspec'
require 'virtus-rspec'

RSpec.configure do |config|
  config.include Mongoid::Matchers
  config.include Virtus::Matchers
end
