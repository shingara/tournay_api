source 'https://rubygems.org'

gem 'railties', :require => false, :git => 'git://github.com/rails/rails.git'
gem 'rails-api', :require => false

gem 'json', :require => false
gem 'rake', :require => false

gem 'mongoid', :require => false, :git => 'git://github.com/mongoid/mongoid.git'
# waiting the release 0.6.x to fix it
gem 'virtus', :require => false, :git => 'git://github.com/solnic/virtus.git'
gem 'equalizer', :require => false
gem 'rabl', :require => false
gem 'draper', :require => false
gem 'state_machine', :require => false

group :test, :development do
  gem 'rspec-rails', :require => false
  gem 'mongoid-rspec', :require => false
  gem 'virtus-rspec', :require => false
  gem 'coveralls', :require => false
end

group :development do
  gem 'rb-inotify', :require => false
  gem 'rb-fsevent', :require => false
  gem 'rb-fchange', :require => false
  gem 'guard-rspec', :require => false

  gem 'foreman', :require => false, :platforms => :ruby
end

group :test do
  gem 'database_cleaner', :require => false
end
