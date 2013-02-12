source 'https://rubygems.org'

gem 'railties', :require => false
gem 'rails-api', :require => false

gem 'json', :require => false
gem 'rake', :require => false

gem 'mongoid', :require => false
gem 'virtus', :require => false
gem 'equalizer', :require => false
gem 'rabl', :require => false
gem 'draper', :require => false

group :test, :development do
  gem 'rspec-rails', :require => false
  gem 'mongoid-rspec', :require => false
  gem 'virtus-rspec', :require => false
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
